class Paper < ApplicationRecord
  #should always have title
  validates :title, presence: true, length: { minimum: 1 }
end
