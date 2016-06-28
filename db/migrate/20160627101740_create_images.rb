class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
    	t.string :file, null: false
    end
  end
end
