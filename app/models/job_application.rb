class JobApplication < ActiveRecord::Base
	belongs_to :employee
	belongs_to :job
end
