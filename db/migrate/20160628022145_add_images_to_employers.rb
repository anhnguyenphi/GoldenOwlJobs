class AddImagesToEmployers < ActiveRecord::Migration
  def change
  	add_reference :images, :employer, index: true, foreign_key: true
  end
end
