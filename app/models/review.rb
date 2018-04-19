class Review < ApplicationRecord
  belongs_to :user
  belongs_to :company
  
  validates :user_id, presence: true
  validates :company_id, presence: true
  validates :title, presence: true
  validates :content, presence: true
  validates :public, inclusion: {in: [true, false]}
end
