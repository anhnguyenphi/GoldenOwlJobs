module JobsHelper
	# make relationship between job and category by giving array categories
	# Params:
	# + categories : array string categories
	def build_categies_by_name(categories)
		categories.each do |c|
			category = Category.find(name: c)
			if category.nil?
				category = Category.new(name: c)
				if category.save
					@job.categories.build({id: categories})
				end
			else
				@job.categories.build({id: category.id})
			end
		end
	end

end
