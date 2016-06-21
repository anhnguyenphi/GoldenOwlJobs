class Job < ActiveRecord::Base
	validates :name, presence: true
	validates :detail, presence: true
	validates :requirement, presence: true
	validates :offer, presence: true


	default_scope -> { order(created_at: :desc) }
end