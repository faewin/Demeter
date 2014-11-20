class User < ActiveRecord::Base
  include BCrypt

  has_many :twits
  validates :name, :email, :password_hash, presence: true
  validates :email, uniqueness: true
  validates_format_of :email, with: /([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})/

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
