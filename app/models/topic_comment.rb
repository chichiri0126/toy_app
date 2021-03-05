class TopicComment < ApplicationRecord
  belongs_to :user
  belongs_to :topic

  validates :body, presence: true

  def deletable? u
    self.user_id == u.id || self.topic.user_id == u.id
  end
end
