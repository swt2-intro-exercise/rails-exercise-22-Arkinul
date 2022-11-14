class Author < ApplicationRecord
  # a method name that returns the full name
  def name
    "#{first_name} #{last_name}"
  end
  #should always have a last name
  validates :last_name, presence: true, length: { minimum: 1 }

  #should have and belong to many papers
  has_and_belongs_to_many :papers
end
