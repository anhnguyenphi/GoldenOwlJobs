class JobApplication < ActiveRecord::Base
  include Filterable
  # associations
	belongs_to :employee, class_name: "Employee"
	belongs_to :job, class_name: "Job"

  #validations
  validates :employee_id, presence: true, uniqueness: {:scope => [:employee_id, :job_id]}
  validates :job_id, presence: true

  validate :employee_exists
  validate :job_exists

  #scope
  default_scope -> { order(created_at: :desc) }

  scope :employee, lambda { |employee_id| where("employee_id = ?", employee_id)  }

  scope :employer, lambda { |employer_id| 
    joins(:job)
    .where("jobs.employer_id = ?", employer_id)
  }

  private
    def employee_exists
      begin
        Employee.find(self.employee_id)
      rescue ActiveRecord::RecordNotFound
        errors.add(:employee_id, "Employee doesn't exists")
        false
      end
    end

    def job_exists
      begin
        Job.find(self.job_id)
      rescue ActiveRecord::RecordNotFound
        errors.add(:job_id, "Job doesn't exists")
        false
      end
    end
end
