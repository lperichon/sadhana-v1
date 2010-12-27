class User < ActiveRecord::Base
  has_many :authentications
  # Include default devise modules. Others available are:
  # :token_authenticatable, :lockable, :timeoutable and :activatable
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable,
         :invitable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :locale

  has_many :practices, :order => "position"
  has_many :practice_events

  has_many :user_contacts, :dependent => :destroy
  has_many :contacts, :through => :user_contacts, :uniq => true

  has_and_belongs_to_many :shared_practices, :join_table => 'practices_users', :class_name => 'Practice'

  before_create :set_locale

  acts_as_subscriber

  def add_to_contacts(user, corresponded = false)
    unless self.contacts.include?(user)
      self.contacts << user
      self.save
    end
    if corresponded
      user.contacts << self
      user.save(:validate => false)
    end
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
    Practice.unscoped.find(:all, :joins => 'JOIN practices_users ON practices_users.practice_id = practices.id',
                           :conditions => ['practices_users.user_id = ?', self.id])
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
    @fb_user ||= FbGraph::User.me(self.authentications.find_by_provider('facebook').token)
  end

  def password_required?
    (authentications.empty? || !password.blank?) && super
  end

  private

  def set_locale
    self.locale = I18n.locale.to_s
  end

  protected

  def apply_facebook(omniauth)
    if (extra = omniauth['extra']['user_hash'] rescue false)
      self.email = (extra['email'] rescue '')
    end
  end
end
