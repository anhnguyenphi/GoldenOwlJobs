class EmployersController < ApplicationController
  def show
  	@employer = Employer.find(params[:id])
  end

  def index
  	@employers = Employer.all
  end

  def manage
  	@employer = Employer.find(params[:employer_id])
  	@jobs = @employer.jobs.all
  end

  def info
  	render 'services'
  end
end
