class CreateJobApplications < ActiveRecord::Migration
  def change
    create_table :job_applications do |t|
    	t.belongs_to :employee
    	t.belongs_to :job
    	t.belongs_to :employer
      t.timestamps null: false
    end
  end
end
