class JobApplicationsController < ApplicationController
	include JobApplicationsHelper
	before_action :authenticate_employee!
	def new
		@job_application = JobApplication.new
		authorize! :create, @job_application
	end

	def create
		authorize! :create, @job_application
		# create new job application
		@job_application = JobApplication.new(content: job_application_params[:content], 
																					employee_id: current_employee.id,
																					job_id: job_application_params[:job_id],
																					employer_id: job_application_params[:employer_id])
		if @job_application.save
			flash[:success] = "Apply successful"
			send_to_employer(job_application_params)
			redirect_to root_path
		else
			flash[:danger] = "Apply fail"
			render 'new'
		end
	end

	private
	def job_application_params
		params.require(:job_application).permit(:employee_name, 
																						:employee_email,
																						:employee_resume, 
																						:content,
																						:job_id,
																						:employer_id)
	end
end
