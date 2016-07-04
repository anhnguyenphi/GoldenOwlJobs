class Employers::JobsController < ApplicationController
	before_action :authenticate_employer!

	def index
		@jobs = Job.where('employer_id = ?', current_employer.id)
	end
	
end
