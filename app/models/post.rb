class Post < ApplicationRecord
  belongs_to :user
  belongs_to :goal
  has_one_attached :image
  has_many :comments

   validates :content, presence: true, unless: :was_attached?

  def was_attached?
    self.image.attached?
  end
end
