class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, uniqueness: true, format: {with: URI::MailTo::EMAIL_REGEXP}
  validates :password, presence: true, length: { minimum: 5 }, confirmation: true

  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy
end