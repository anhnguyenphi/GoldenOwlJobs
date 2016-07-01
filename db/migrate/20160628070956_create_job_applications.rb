class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
    	t.belongs_to :employee
    	t.belongs_to :job
    	# t.belongs_to :employer
      t.timestamps null: false
    end

    add_index :job_applications, :employee_id
    add_index :job_applications, :job_id
    add_index :job_applications, [:job_id, :employee_id], unique: true
  end
end
