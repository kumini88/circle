class Eventcomment < ApplicationRecord
  belongs_to :user
  belongs_to :event
  
  validates :user_id, presence: true
  validates :event_id, presence: true
  validates :content, length: { maximum: 500 }
end
