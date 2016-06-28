class AddFieldToJobApplication < ActiveRecord::Migration
  def change
  	add_column :job_applications, :content, :text, default: ""
  end
end
