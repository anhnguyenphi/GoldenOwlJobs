class AddRelationCityAndEmployee < ActiveRecord::Migration
  def change
  	add_reference :employees, :city, index: true, foreign_key: true
  end
end
