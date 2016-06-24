class ApplyRelationship < ActiveRecord::Base
	belongs_to :employee
	belongs_to :job
	validates :employee_id, presence: true
	validates :job_id, presence: :true
end
