class Job < ActiveRecord::Base
	#associations
	belongs_to :employer
	has_and_belongs_to_many :categories
	has_and_belongs_to_many :cities

	#validate
	validates :name, presence: true


	default_scope -> { order(created_at: :desc) }
end
