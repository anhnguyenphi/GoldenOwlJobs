class AddFieldToEmployer < ActiveRecord::Migration
  def change
  	add_column :employers, :name, :string, null: false, default: ""
  	add_column :employers, :short_description, :string, null: false, default: ""
  	add_column :employers, :full_description, :string, null: false, default: ""
  	add_column :employers, :offer, :string, null: false, default: ""
  	add_column :employers, :address, :string, null: false, default: ""
  end
end
