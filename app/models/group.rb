class Group < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :group_id, presence: true, length: {maximum: 20 },
                      format: { with: /[a-z0-9]/},
                      uniqueness: { case_sensitive: true }
  validates :profile, length: { maximum: 255 }
  
  mount_uploader :image, ImageUploader
  def icon
    if self.image.present?
      self.image
    else
      return "icon_group_default.jpg"
    end
  end
  
  #member_____________________________________________________________________________________________________
  has_many :members
  has_many :member_users, through: :members, source: :user
  
  #applicant____________________________________________________________________
  has_many :applicants
  has_many :applicant_users, through: :applicants, source: :user
  
  #grouprelationship____________________________________________________________
  has_many :grouprelationships
  has_many :group_followers, through: :grouprelationships, source: :user
  
  #post_______________________________________________________________________________________________________
  has_many :posts
  
  #event______________________________________________________________________________________________________
  has_many :events
end
