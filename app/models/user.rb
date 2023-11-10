class User < ApplicationRecord
  has_secure_password

  has_many :anon_messages

  # VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :name, presence: true, length: { maximum: 50 }

  validates :email, presence: true,
                    length: { maximum: 200 }, uniqueness: { case_sensitive: false }
  validates :password_digest, presence: true, length: { minimum: 6 }

end
