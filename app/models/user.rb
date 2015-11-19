class User < ActiveRecord::Base
  include BCrypt
  has_many :answers
  has_many :questions
  has_many :comments
  has_many :votes
  validates :email, uniqueness: true

  def password
    @password = Password.new(password_hash)
    self.password_hash = @password
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
