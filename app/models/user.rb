class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  before_save :downcase_email
  validates :name, presence: true,
    length: {maximum: Settings.name.length.MAXIMUM}
  validates :email, presence: true,
    length: {maximum: Settings.email.length.MAXIMUM},
    format: {with: VALID_EMAIL_REGEX},
    uniqueness: {case_sensitive: false}
  has_secure_password
  validates :password, presence: true,
    length: {minimum: Settings.password.length.MINIMUM}

  private

  def downcase_email
    self.email = email.downcase
  end
end
