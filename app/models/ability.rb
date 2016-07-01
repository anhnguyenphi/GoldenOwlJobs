class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= Employee.new
    if user.new_record?
        can :read, Job
    elsif user.instance_of?(Employee)
        can :read, Job
        can :create, JobApplication
        can :read, JobApplication, employee_id: user.id
        can :destroy, JobApplication, employee_id: user.id
    elsif user.instance_of?(Employer)
        can [:read, :create] , Job
        can [:update, :destroy], Job, employer_id: user.id
    elsif user.instance_of?(AdminUser)
        can :manage, :all
    end
  end
end
