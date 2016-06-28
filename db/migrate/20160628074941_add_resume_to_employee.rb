class AddResumeToEmployee < ActiveRecord::Migration
  def change
  	add_column :employees, :resume, :string
  end
end
