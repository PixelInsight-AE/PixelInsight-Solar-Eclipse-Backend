class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true, length: { minimum: 3, maximum: 20 }
  validates :email, presence: true, uniqueness: true, length: { minimum: 3, maximum: 50 }
  validates :password, presence: true, length: { minimum: 8, maximum: 20 }

  has_many :sessions
  has_many :cards

  after_validation :hash_password

  def hash_password
    self.password = BCrypt::Password.create(self.password)
  end
end
