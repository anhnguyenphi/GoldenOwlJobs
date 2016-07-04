module Accessible
  extend ActiveSupport::Concern

  protected

  def avoid_conflict_user
    flash.clear
    alert = 'You need to sign out in order to sign in or sign up as other user'
    if current_admin_user
      redirect_to(admin_dashboard_path, alert: alert) && return
    elsif current_employer
      redirect_to(root_path, alert: alert) && return
    elsif current_employer
     redirect_to(root_path, alert: alert) && return
    end
  end
end