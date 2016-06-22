class AddNToNBetweenJobsAndCategory < ActiveRecord::Migration
  def change
  	# Create table for relation many to many between job and category model
  	create_table :categories_jobs, id: false do |t|
      t.belongs_to :job, index: true
      t.belongs_to :category, index: true
    end
  end
end
