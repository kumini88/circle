class Companymember < ApplicationRecord
  belongs_to :user
  belongs_to :company
  
  validates :user_id, presence: true
  validates :company_id, presence: true
  validates :owner, inclusion: {in: [true, false]}
end
