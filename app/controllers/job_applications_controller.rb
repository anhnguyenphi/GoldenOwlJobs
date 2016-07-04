class JobApplicationsController < ApplicationController
	include JobApplicationsHelper
	before_action :authenticate_employee!

	def new
		@job_application = JobApplication.new
		authorize! :create, @job_application
	end

	def create
		# create new job application
		@job_application = JobApplication.new(content: job_application_params[:content],
																					employee_id: current_employee.id,
																					job_id: job_application_params[:job_id])
		# authorize
		authorize! :create, @job_application
		# save
		if @job_application.save
			flash[:success] = "Apply successful"
			send_to_employer(job_application_params)
			@job = Job.find(@job_application.job_id)
			redirect_to job_path(@job_application.job_id)
		else
			flash.now[:danger] = "Apply fail"
			render 'new'
		end
	end

	def destroy

		@job_apply = current_employee.job_applications.find_by(job_id: params[:job_id])
		@job_apply.destroy

		redirect_to job_path(params[:job_id])
	end

	private
		def job_application_params
			params.require(:job_application).permit(:employee_resume,
																							:content,
																							:job_id)
		end
end
