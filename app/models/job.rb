class Job < ActiveRecord::Base
	include Filterable
	#associations
	belongs_to :employer
	has_and_belongs_to_many :categories, :uniq => true
	has_and_belongs_to_many :cities, :uniq => true
	has_many :employees, through: :apply_relationships, source: :employee

	#validate
	validates :name, presence: true
	validates :detail, presence: true
	validates :requirement, presence: true
	validates :offer, presence: true

	# scope

	default_scope -> { order(created_at: :desc) }

	# query by keyword
	scope :keyword, lambda { |keyword|
		joins(:employer)
		.where("jobs.name LIKE '%' || ? || '%' 
						OR employers.name LIKE '%' || ? || '%'", 
						keyword, 
						keyword)
		.distinct
	}

	# query by name of job
	scope :job_name, lambda { |name|
		where("jobs.name LIKE '%' || ? || '%'", name)
	}

	#query by categories
	scope :categories, lambda { |categories|
		joins(:categories)
		.where("categories.name IN (?)", categories)
		.distinct
	}

	# query by cities
	scope :cities, lambda { |cities|
		joins(:cities)
		.where("cities.id IN (?)", cities)
		.distinct
	}

	# query by employer
	scope :employer, lambda { |name|
		joins(:employer)
		.where("employers.name LIKE '%' || ? || '%'", name)
	}
end
