class JobsController < ApplicationController

	def index
		@jobs = Job.all
	end

	def new
		@job = Job.new
	end

	def create
		@job = Job.new(job_params)
		if @job.save
			flash[:success] = "Post job success!"
			redirect_to @job
		else
			flash.now[:success] = "Post job fail!"
			render 'new'
		end
	end


	def show
		@job = Job.find(params[:id])
	end

	def edit
		@job = Job.find(params[:id])
	end

	def update
		@job = Job.find(params[:id])
		@job.assign_attributes(job_params)

		if @job.save
			flash[:success] = "Edit job success!"
			redirect_to @job
		else
			flash.now[:success] = "Edit job fail!"
			render 'edit'
		end
	end

	def destroy
		@job = Job.find(params[:id])
		@job.destroy
		redirect_to jobs_path
	end

	private

	def job_params
		params.require(:job).permit(:name, :negotiable, :min_salary, :max_salary, :detail, :requirement, :offer)
	end
end
