class Goal < ApplicationRecord
  belongs_to :user

  validates :purpose, presence: true
  validates :goal, presence: true
  validates :action, presence: true
  validates :deadline, presence: true
end
