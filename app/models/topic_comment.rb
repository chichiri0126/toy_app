class TopicComment < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  validates :body, presence: true
  validates :user_id, presence: true
  validates :topic_id, presence: true

  def deletable? u
    self.user_id == u.id || self.topic.user_id == u.id
  end
end
