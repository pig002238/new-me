class Goal < ApplicationRecord
  belongs_to :user
  has_many :posts

  validates :purpose, presence: true
  validates :goal, presence: true
  validates :action, presence: true
  validates :deadline, presence: true
end
