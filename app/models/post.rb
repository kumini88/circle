class Post < ApplicationRecord
  belongs_to :user
  belongs_to :group, optional: true
  belongs_to :company, optional: true
  
  validates :user_id, presence: true
  validates :content, length: { maximum: 500 }
  mount_uploader :image, ImageUploader
  
  #comment__________________________________________________________________________________________
  has_many :comments
  
  #favorite________________________________________________________________________________________________
  has_many :favorites
  has_many :favorites, dependent: :destroy
  has_many :favorite_users, through: :favorites, source: :user
end
