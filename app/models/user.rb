class User < ActiveRecord::Base
  has_secure_password
  
  before_validation :downcase_email
  validates :name, presence: true, length: {maximum: 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 3}
  
private
  def downcase_email
    self.email = self.email.downcase if self.email.present?
  end
end