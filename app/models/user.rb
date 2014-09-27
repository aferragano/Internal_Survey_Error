class User < ActiveRecord::Base 
  include BCrypt

  has_many :surveys
  has_secure_password                      
  
  validates :name,      presence: true
  validates :email,     uniqueness: true,
                        format: { :with => /\w+@\w+\.\w+/}
  validate :password,   presence: true,
                        length: { in: 6..20 }
end
