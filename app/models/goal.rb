class Goal < ApplicationRecord
  belongs_to :user
  has_many :posts
  def self.search(search)
    if search != ""
      Goal.where('text LIKE(?)', "%#{search}%")
    else
      Goal.all
    end
  end

  validates :purpose, presence: true
  validates :goal, presence: true
  validates :action, presence: true
  validates :deadline, presence: true
end
