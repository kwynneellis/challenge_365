class Log < ApplicationRecord
  belongs_to :user
  belongs_to :challenge

  validates :user_id, presence: true
end
