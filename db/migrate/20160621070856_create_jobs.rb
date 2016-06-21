class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
    	t.string :name, null: false, default: ""
    	t.boolean :negotiable, default: true
      t.integer :min_salary, default: 0
      t.integer :max_salary, default: 0
    	t.text :detail, null: false ,default: ""
    	t.text :requirement, null: false, default: ""
    	t.text :offer, null: false, default: ""
      t.timestamps null: false
    end
  end
end
