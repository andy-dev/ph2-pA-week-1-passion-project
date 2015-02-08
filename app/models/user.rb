require 'bcrypt'

class User < ActiveRecord::Base
  has_many :notes
  has_many :views


  validates :user_name, uniqueness: { :message => "Username already Exists"}
  validates :user_name, presence: {:message => "Need Username and Password to login/register"}

  include BCrypt
  def password_hash
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end



end






