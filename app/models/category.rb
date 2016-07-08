class Category < ActiveRecord::Base
	# job has and belongs to many category
	has_and_belongs_to_many :jobs,-> { uniq }, dependent: :nullify
	# name must be filled
	validates :name, presence: true
end
