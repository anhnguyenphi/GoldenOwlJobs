class JobsController < ApplicationController
	before_action :check_employer_when_create, only: [:new, :create]
	before_action :check_employer_when_delete_update, only: [:destroy, :edit, :update]
	include JobsHelper

	def search
		@search_key = search_params
		@jobs = Job.filter(search_params)
	end

	def index
		@jobs = Job.all
	end

	def new
		@job = Job.new
	end

	def create
		employer = current_employer
		@job = current_employer.jobs.build(job_params)
		# check valid infomation
		valid = (@job.save && 
			job_categories[:categories] && 
			build_categies_by_name?(job_categories[:categories]) &&
			build_cities_by_id?(job_cities[:cities]))

		if valid
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
		redirect_to params[:redirect_path]
	end

	private
		def check_employer_when_create
			if current_employer.nil?
				redirect_to root_path
			end
		end

		def check_employer_when_delete_update
			job = Job.find(params[:id])
			if current_employer.nil? && current_employer[:id] == job[:employer_id]
				redirect_to root_path
			end
		end

		def job_params
			params.require(:job).permit(:name, :negotiable, :min_salary, 
				:max_salary, :detail, :requirement, :offer)
		end

		def job_categories
			params.require(:job).permit(:categories => [])
		end

		def job_cities
			params.require(:job).permit(:cities => [])
		end

		def search_params
			params.required(:search).permit(:keyword, :categories => [], :cities => [])
		end
end
