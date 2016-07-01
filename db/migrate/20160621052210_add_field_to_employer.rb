class AddFieldToEmployer < ActiveRecord::Migration
  def change
  	add_column :employers, :name, :string, null: false, default: ""
  	add_column :employers, :short_description, :text, null: false, default: ""
  	add_column :employers, :full_description, :text, null: false, default: ""
  	add_column :employers, :offer, :text, null: false, default: ""
  	add_column :employers, :address, :text, null: false, default: ""
  end
end
