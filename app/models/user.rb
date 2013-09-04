class User < ActiveRecord::Base
  has_many :comments
  has_many :posts
  
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true

  include BCrypt

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(pass)
    @password = Password.create(pass)
    self.password_digest = @password
  end

  def self.authenticate(username, password)
    user = User.find_by_username(username)
    if user && (user.password == password)
      return user 
    else
      nil
    end
  end
end
