class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # overide cancan
  def current_ability
  	if current_employee.present?
		  @current_ability ||= Ability.new(current_employee)
	  elsif current_employer.present?
	  	@current_ability ||= Ability.new(current_employer)
	  elsif current_admin_user.present?
	  	@current_ability ||=  Ability.new(current_admin_user)
	  else
	  	@current_ability ||= Ability.new(nil)
	  end
	end

	rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, :alert => exception.message
  end
end
