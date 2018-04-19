class User < ApplicationRecord
  before_save { self.email.downcase! }
  validates :name, presence: true, length: { maximum: 20 }
  validates :user_id, presence: true, length: {maximum: 15 },
                      format: { with: /[a-z0-9]/},
                      uniqueness: { case_sensitive: true }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  validates :profile, length: { maximum: 255 }
  has_secure_password
  
  mount_uploader :image, ImageUploader
  def icon
    if self.image.present?
      self.image
    else
      return "icon_user_default.jpg"
    end
  end

  #relationship_________________________________________________________________
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "follow_id"
  has_many :followers, through: :reverse_of_relationships, source: :user
  
  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(follow_id: other_user.id)
    end
  end
  
  def unfollow(other_user)
    relationship = self.relationships.find_by(follow_id: other_user.id)
    relationship.destroy if relationship
  end
  
  def following?(other_user)
    self.followings.include?(other_user)
  end
  
  
  #post_________________________________________________________________________________________________________________________
  has_many :posts
  
  def feed_posts
    Post.where(user_id: self.following_ids + [self.id])
  end  

  #comment______________________________________________________________________
  has_many :comments

  #favorite_____________________________________________________________________
  has_many :favorites
  has_many :favorite_posts, through: :favorites, source: :post
  
  def favorite(post)
    self.favorites.find_or_create_by(post_id: post.id)
  end
  
  def unfavorite(post)
    favorite = self.favorites.find_by(post_id: post.id)
    favorite.destroy if favorite
  end
  
  def favorite?(post)
    self.favorite_posts.include?(post)
  end

  
  #event________________________________________________________________________________________________________________________
  has_many :events
  
  def feed_events
    Event.where(user_id: self.following_ids + [self.id])
  end  
  
  #eventcomment_________________________________________________________________
  has_many :eventcomments
  
  #clip_________________________________________________________________________
  has_many :clips
  has_many :clip_events, through: :clips, source: :event
  
  def clip(event)
    self.clips.find_or_create_by(event_id: event.id)
  end
  
  def unclip(event)
    clip = self.clips.find_by(event_id: event.id)
    clip.destroy if clip
  end
  
  def clip?(event)
    self.clip_events.include?(event)
  end
  
  #join_________________________________________________________________________
  has_many :joins
  has_many :join_events, through: :joins, source: :event
  
  def join(event)
    self.joins.find_or_create_by(event_id: event.id)
  end
  
  def unjoin(event)
    join = self.joins.find_by(event_id: event.id)
    join.destroy if join
  end
  
  def join?(event)
    self.join_events.include?(event)
  end
  
  #member_______________________________________________________________________________________________________________________
  has_many :members
  has_many :member_groups, through: :members, source: :group
  
  def member(group)
    self.members.find_or_create_by(group_id: group.id)
  end
  
  def member?(group)
    self.member_groups.include?(group)
  end

  def unmember(group)
    member = self.members.find_by(group_id: group.id)
    member.destroy
  end
  
  #applicant____________________________________________________________________
  has_many :applicants
  has_many :applicant_groups, through: :applicants, source: :group

  def applicant(group)
    self.applicants.find_or_create_by(group_id: group.id)
  end
  
  def applicant?(group)
    self.applicant_groups.include?(group)
  end
  
  def unapplicant(group)
    applicant = self.applicants.find_by(group_id: group.id)
    applicant.destroy
  end
  
  #grouprelationship____________________________________________________________
  has_many :grouprelationships
  has_many :following_groups, through: :grouprelationships, source: :group
  
  def groupfollow(group)
    self.grouprelationships.find_or_create_by(group_id: group.id)
  end
  
  def ungroupfollow(group)
    grouprelationship = self.grouprelationships.find_by(group_id: group.id)
    grouprelationship.destroy
  end
  
  def groupfollowing?(group)
    self.following_groups.include?(group)
  end
  
  #companymember________________________________________________________________________________________________________________
  has_many :companymembers
  has_many :member_companies, through: :companymembers, source: :company
  
  def companymember(company)
    self.companymembers.find_or_create_by(company_id: company.id)
  end
  
  def uncompanymember(company)
    companymember = self.companymembers.find_by(company_id: compant.id)
    companymember.destroy
  end
  
  def companymember?(company)
    self.company_companies.include?
  end
  
  #companyrelationship__________________________________________________________
  has_many :companyrelationships
  has_many :following_companies, through: :companyrelationships, source: :company
  
  def companyfollow(company)
    self.companyrelationships.find_or_create_by(company_id: company.id)
  end
  
  def uncompanyfollow(company)
    companyrelationship = self.companyrelationships.find_by(company_id: company.id)
    companyrelationship.destroy if companyrelationship
  end
  
  def companyfollowing?(company)
    self.following_companies.include?(company)
  end
  
  #review_______________________________________________________________________
  has_many :reviews
    
end
