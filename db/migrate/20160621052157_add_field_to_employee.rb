class AddFieldToEmployee < ActiveRecord::Migration
  def change
  	add_column :employees, :first_name, :string, null: false, default: ""
  	add_column :employees, :last_name, :string, null: false, default: ""
  	add_column :employees, :address, :string, default: ""
  end
end
