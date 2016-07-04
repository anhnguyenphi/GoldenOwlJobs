class Employers::JobApplicationsController < ApplicationController
	before_action :authenticate_employer!
	
	def index
		@job_applications = JobApplication.filter(:employer => current_employer.id)
		@job_applications.each do |ja|
			authorize! :read, ja
		end
	end
end
