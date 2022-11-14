class Paper < ApplicationRecord
  #should always have title
  validates :title, presence: true, length: { minimum: 1 }
  #should always have venue
  validates :venue, presence: true, length: { minimum: 1 }
  #should always have year and it should be an integer
  validates :year, presence: true, numericality: { only_integer: true }

  #should have and belong to many authors
  has_and_belongs_to_many :authors
  #should have scope for year
  scope :published_in, ->(year) { where("year = ?", year) }

end
