class Topic < ApplicationRecord
  belongs_to :user

  has_many :topic_comments

  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 255 }
  validates :description, presence: true, length: { maximum: 1000 }

end
