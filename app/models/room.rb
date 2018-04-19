class Room < ApplicationRecord
  validates :name, presence: true
  
  mount_uploader :image, ImageUploader
  
  def icon
    if self.image.present?
      self.image
    else
      return "icon_room_default.jpg"
    end
  end
end
