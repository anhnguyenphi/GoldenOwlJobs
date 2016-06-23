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

end
