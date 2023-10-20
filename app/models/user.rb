class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :goals
  has_many :posts
  validates :nickname, presence: true
end
