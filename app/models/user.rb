class User < ActiveRecord::Base
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

  private

  def set_locale
    self.locale = I18n.locale.to_s
  end
end
