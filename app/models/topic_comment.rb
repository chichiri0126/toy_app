class TopicComment < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  validates :user_id, presence: true
  validates :topic_id, presence: true
  validates :body, presence: true, length: { maximum: 1000 }
  validates :commented_at, presence: true

  def deletable? u
    self.user_id == u.id || self.topic.user_id == u.id
  end
end
