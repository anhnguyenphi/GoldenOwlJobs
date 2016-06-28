class CreateApplyRelationships < ActiveRecord::Migration
  def change
    create_table :apply_relationships do |t|
      t.integer :employee_id
      t.integer :job_id

      t.timestamps null: false
    end

    add_index :apply_relationships, :employee_id
    add_index :apply_relationships, :job_id
    add_index :apply_relationships, [:employee_id, :job_id], unique: true
  end
end
