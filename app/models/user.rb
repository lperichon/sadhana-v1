class User < ActiveRecord::Base
  has_many :authentications
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :invitable, :encryptable, :encryptor => :sha1

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :locale, :invited_by, :remember_me

  has_many :practices, :order => "position"
  has_many :practice_events

  has_many :user_contacts
  has_many :contacts, :through => :user_contacts, :uniq => true

  before_destroy :destroy_user_contacts

  has_many :shared_practices

  before_create :set_locale

  after_save :add_to_corresponded_contacts

  attr_accessor :invited_by, :corresponded_contacts

  acts_as_subscriber

  def corresponded_contacts
    unless @corresponded_contacts
      @corresponded_contacts = []
    end
    @corresponded_contacts
  end

  def add_to_corresponded_contacts
    corresponded_contacts.each do |user|
      unless user.contacts.include?(self)
        user.contacts << self
        user.save
      end
    end
  end

  def add_to_contacts(user, corresponded = false, save = true)
    if corresponded
      corresponded_contacts << user
    end
    unless self.contacts.include?(user)
      self.contacts << user
      self.save if save
    end
  end

  def invited_by= user_id
    user = User.find(user_id)
    if user
      add_to_contacts(user, true, false)
    end
    @invited_by = user_id
  end

  def subscription_plan_check(plan = self.subscription_plan)
    plan != self.subscription_plan && !plan.available
#    exceeded = {}
#    exceeded[:practice_count] = practices_subscription_check(plan)
#    exceeded unless exceeded.empty?
  end

  def practices_subscription_check(plan)
    plan.max_practices if plan.max_practices.to_i >= 0 &&  self.practices.count >= plan.max_practices.to_i
  end

  def calendar_subscription_check(plan)
    plan == SubscriptionPlan.default_plan 
  end

  def share_subscription_check(plan)
    !plan.share_practices
  end

  def all_practices
    (self.practices + self.unscoped_shared_practices).sort {|a,b| a.id <=> b.id }
  end

  def unscoped_practices
    Practice.unscoped.find(:all, :conditions => {:user_id => self.id})
  end

  def archived_practices
    Practice.unscoped.find(:all, :conditions => {:user_id => self.id, :state => 'archived'})
  end

  def unscoped_shared_practices
    Practice.unscoped.find(:all, :joins => 'JOIN shared_practices ON shared_practices.practice_id = practices.id',
                           :conditions => ['shared_practices.user_id = ?', self.id])
  end

  def apply_omniauth(omniauth)
    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'], :token =>(omniauth['credentials']['token'] rescue nil))
  end

#  def apply_omniauth(omniauth)
#    case omniauth['provider']
#    when 'facebook'
#      self.apply_facebook(omniauth)
#    end
#    authentications.build(:provider => omniauth['provider'], :uid => omniauth['uid'], :token =>(omniauth['credentials']['token'] rescue nil))
#  end

  def facebook
    fb_auth = self.authentications.select {|a| a.provider == 'facebook'}.first
    @fb_user ||= FbGraph::User.me(fb_auth.token).fetch unless fb_auth.nil?
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  private

  def set_locale
    self.locale = I18n.locale.to_s
  end

  def destroy_user_contacts
    UserContact.where("user_id=#{id}").delete_all
    UserContact.where("contact_id=#{id}").delete_all
  end

  protected

  def apply_facebook(omniauth)
    if (extra = omniauth['extra']['user_hash'] rescue false)
      self.email = (extra['email'] rescue '')
    end
  end
end
