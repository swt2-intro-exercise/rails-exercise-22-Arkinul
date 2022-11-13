class Author < ApplicationRecord
  # a method name that returns the full name
  def name
    "#{first_name} #{last_name}"
  end
end
