class User < ActiveRecord::Base
  has_many :groups
  has_many :joins, dependent: :destroy
  has_many :groups_joined, through: :joins, source: :group
  has_secure_password
  
  EMAIL_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :first_name, :last_name, presence: true
  validates_length_of :password, :minimum => 8
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: { with: EMAIL_REGEX }
  
  before_save :email_lowercase

  def email_lowercase
    email.downcase!
  end
end
