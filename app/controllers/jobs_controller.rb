class JobsController < ApplicationController

	def index
		@jobs = Job.all
	end

	def new
		@job = Job.new
	end

	def create
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

end
