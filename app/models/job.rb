class Job < ActiveRecord::Base
	#associations
	belongs_to :employer

	#validate
	validates :name, presence: true


	default_scope -> { order(created_at: :desc) }
end
