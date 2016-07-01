class JobApplication < ActiveRecord::Base
	belongs_to :employee, class_name: "Employee"
	belongs_to :job, class_name: "Job"

  validates :employee_id, presence: true, uniqueness: {:scope => [:employee_id, :job_id]}
  validates :job_id, presence: true

  validate :employee_exists
  validate :job_exists


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
