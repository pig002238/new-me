class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :goals, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :remindeies, dependent: :destroy
  validates :nickname, presence: true

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
end
