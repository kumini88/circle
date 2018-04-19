class Company < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 },
                      uniqueness: { case_sensitive: true }
  validates :profile, length: { maximum: 255 }
  
  mount_uploader :image, ImageUploader
  def icon
    if self.image.present?
      self.image
    else
      return "icon_company_default.png"
    end
  end
  
  #companymember__________________________________________________________________________________
  has_many :companymembers
  has_many :member_users, through: :companymembers, source: :user
  
  #review_______________________________________________________________________
  has_many :reviews

  #companyrelationship__________________________________________________________
  has_many :companyrelationships
  has_many :company_followers, through: :companyrelationships, source: :user
  
  #post___________________________________________________________________________________________
  has_many :posts
  
  #event__________________________________________________________________________________________
  has_many :events
end
