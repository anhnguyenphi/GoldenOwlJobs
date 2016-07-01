class JobApplicationsController < ApplicationController
	include JobApplicationsHelper
	before_action :authenticate_employee!
	before_action :check_employee, only: [:create, :destroy]

	def new
		@job_application = JobApplication.new
	end

	def create
		@job_application = JobApplication.new(content: job_application_params[:content],
																					employee_id: current_employee.id,
																					job_id: job_application_params[:job_id])

		if @job_application.save
			flash[:success] = "Apply successful"
			# send_to_employer(job_application_params)
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
			params.require(:job_application).permit(:employee_name,
																							:employee_email,
																							:employee_resume,
																							:content,
																							:job_id)
		end

		def check_employee
			if current_employee.nil?
				redirect_to root_path
			end
		end
end
