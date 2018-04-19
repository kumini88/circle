class Event < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true
  belongs_to :company, optional: true
  
  validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 15 }
  validates :content, presence: true, length: {maximum: 1000 }
  validates :date, presence: true
  validates :place, presence: true, length: { maximum: 30 }
  mount_uploader :image, ImageUploader
  
  #comment________________________________________________________________________________________________
  has_many :eventcomments, dependent: :destroy
  
  #clip____________________________________________________________________________________________________
  has_many :clips, dependent: :destroy
  has_many :clip_users, through: :clips, source: :user
  
  #join____________________________________________________________________________________________________
  has_many :joins, dependent: :destroy
  has_many :join_users, through: :joins, source: :user
end
