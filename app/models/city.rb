class City < ActiveRecord::Base
	has_many :employees
	has_and_belongs_to_many :jobs
end
