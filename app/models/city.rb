class City < ActiveRecord::Base
	has_many :employees
	has_and_belongs_to_many :jobs

  validates :name, presence: true, uniqueness: true
end
