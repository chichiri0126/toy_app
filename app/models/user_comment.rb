class UserComment < ApplicationRecord
  belongs_to :user
  belongs_to :user_thread

  validates :body, presence: true

  def deletable? u
    self.user_id == u.id || self.user_thread.user_id == u.id
  end
end
