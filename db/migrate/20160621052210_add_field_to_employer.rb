class AddFieldToEmployer < ActiveRecord::Migration
  def change
  	add_column :employers, :name, :string, null: false, default: ""
  	add_column :employers, :short_description, :string, default: ""
  	add_column :employers, :full_description, :string, default: ""
  	add_column :employers, :offer, :string, default: ""
  	add_column :employers, :address, :string, default: ""
  end
end
