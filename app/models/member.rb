class Member < ApplicationRecord
  belongs_to :user
  belongs_to :group
  
  validates :user_id, presence: true
  validates :group_id, presence: true
  validates :owner, inclusion: {in: [true, false]}
end