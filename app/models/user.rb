class User < ActiveRecord::Base
  has_secure_password
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true
  validates :password, presence: true
  validates :password_confirmation, presence: true
  validates :password, length: { minimum: 3 }
  validates :email, uniqueness: { case_sensitive: false}
  
  def self.authenticate_with_credentials(email, password)
    stripped_email = email.downcase.strip
    user = User.find_by_email(stripped_email)
    if user && user.authenticate(password)
      user
    else
      false
    end
  end
end
