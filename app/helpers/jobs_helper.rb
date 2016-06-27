module JobsHelper
	# make relationship between job and category by giving array categories
	# Params:
	# + categories : array string categories
	# + RETURN: true if success else false
	def build_categies_by_name?(categories)
		categories.each do |c|
			category = Category.where(name: c).first
			if category.nil?
				# if not exist category, create new
				category = Category.new(name: c)
				if category.save
					@job.categories << category
				else
					return false
				end
			else
				# if the category was exist
				@job.categories << category
			end
		end
		return true
	end

	# make relationship between job and city by giving array city_ids
	# Params:
	# + categories : array city_id
	# + RETURN: true if success else false
	def build_cities_by_id?(cities)
		cities.each do |c|
			city = City.find(c)
			if city.nil?
				return false
			else
				@job.cities << city
			end
		end
		return true
	end
	
end
