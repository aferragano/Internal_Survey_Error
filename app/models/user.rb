class User < ActiveRecord::Base
  include BCrypt
    
  has_many :surveys
  
  validates :name,      presence: true
  validates :email,     uniqueness: true,
                        format: { :with => /\w+@\w+\.\w+/}
  validate :password,   presence: true,
                        length: { in: 6..20 }

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def self.authenticate(user_info)
    email = user_info[:email]
    password = user_info[:password]

    user = User.find_by(email: email)
    return user if user && user.password == password
    nil
  end

end
