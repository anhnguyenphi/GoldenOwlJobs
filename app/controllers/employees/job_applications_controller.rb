class Employees::JobApplicationsController < ApplicationController
	before_action :authenticate_employee!

	def index
		@job_applications = JobApplication.filter(:employee => current_employee.id)
		# authorize each job application
		@job_applications.each do |ja|
			authorize! :read, ja
		end
	end

	def show
		@job_application = JobApplication.find(params[:id])
		authorize! :read, @job_application
		render json: @job_application
	end

	def destroy
		@job_application = current_employee.job_applications.find_by(job_id: params[:job_id])
		# authorize
		authorize! :destroy, @job_application
		@job_application.destroy
		redirect_to employees_job_applications_path
	end
end
