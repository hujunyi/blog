class User < ActiveRecord::Base
  has_many :posts
  attr_accessor :password
  validates_confirmation_of :password
  validates_presence_of :password, :on=> :create
  before_save :encrypted_password
  def self.authenticate(email,password)
    user = find_by(email: email)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  def encrypted_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
