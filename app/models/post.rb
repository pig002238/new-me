class Post < ApplicationRecord
  belongs_to :user
  belongs_to :goal

  validates :content, presence: true
end
