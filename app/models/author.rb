class Author < ApplicationRecord
  # a method name that returns the full name
  def name
    "#{first_name} #{last_name}"
  end
  #should always have a last name
  validates :last_name, presence: true
end
