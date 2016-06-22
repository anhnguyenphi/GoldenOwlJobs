class EmployersController < ApplicationController
  def show
  	@employer = Employer.find(params[:id])
  end

  def index
  	@employers = Employer.all
  end
end
