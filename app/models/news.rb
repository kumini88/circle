class News < ApplicationRecord
  validates :title, presence: true
  validates :link, presence: true, uniqueness: { case_sensitive: true }
  validates :date, presence: true
  validates :source, presence: true
  validates :category, presence: true, inclusion: {in: ["trd", "fin", "adv", "con" "it", "ele", "hmn", "htl", "med", "fod", "csm", "tv", "car", "apa", "hus", "cst", "che", "ven" ]}
end
