class UserThread < ApplicationRecord
  belongs_to :user

  has_many :user_comments

  validates :title, presence: true

end
