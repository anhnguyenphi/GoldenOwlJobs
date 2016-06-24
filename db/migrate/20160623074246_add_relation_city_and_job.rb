class AddRelationCityAndJob < ActiveRecord::Migration
  def change
  	create_table 'cities_jobs', id: false do |t|
  		t.belongs_to :city, index: true
  		t.belongs_to :job, index: true
  	end
  end
end
