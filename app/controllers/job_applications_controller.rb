class JobApplicationsController < ApplicationController
	include JobApplicationsHelper
	before_action :authenticate_employee!, only: [:new, :create, :destroy]
	@@RESUME_FORMAT = [".pdf", ".doc", ".docx"]

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
		if check_resume_extension && @job_application.save
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
		@job_application = current_employee.job_applications.find_by(job_id: params[:job_id])
		authorize! :destroy, @job_application
		
		@job_application.destroy
		redirect_to job_path(params[:job_id])
	end

	private
		def job_application_params
			if params[:resume] == "current"
				params.require(:job_application).permit(:content,
																								:job_id)
			elsif params[:resume] == "new"
				params.require(:job_application).permit(:employee_resume,
																								:content,
																								:job_id)
			end		
		end

		def check_resume_extension
			if job_application_params[:employee_resume].present?
				@@RESUME_FORMAT.include? File.extname(job_application_params[:employee_resume].original_filename)
			else
				return true
			end
		end
end
