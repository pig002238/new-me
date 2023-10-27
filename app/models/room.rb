class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  has_many :users, through: :room_users
  has_many :messages, dependent: :destroy

  validates :name, presence: true

  def self.search(search)
    if search != ""
      Room.where('text LIKE(?)', "%#{search}%")
    else
      Room.all
    end
  end
end
