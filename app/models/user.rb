class User < ActiveRecord::Base
  include BCrypt

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true

  validate :legit_password

  def password
    @password ||= Password.new(hashed_password)
    # both creat bcrypt object
  end

  def password=(registration_password)
    @raw_password = registration_password
    @password = Password.create(registration_password)
    # ruby calls it casting where an object only knows it as a string
    self.hashed_password = @password
  end

  def authenticate(password_attempt)
    self.password == password_attempt
    # password_attempt.==(self.password)
  end

  def legit_password
    if @raw_password.nil? || @raw_password == ""
      errors.add(:password, "is required")
    elsif @raw_password.length < 6
      errors.add(:password, "must be 6 characters or more")
    end
  end
end
