class User < ApplicationRecord

  has_secure_password

  validates :name, presence: true

  validates :email,
    uniqueness: { case_sensitive: false },
    presence: true

  validates :password,
    confirmation: true,
    presence: true,
    length: { minimum: 6 }

  validates :password_confirmation,
    presence: true

  def self.authenticate_with_credentials(email, password)
    email = email.strip
    email = email.downcase
    user = User.find_by_email(email)

    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
