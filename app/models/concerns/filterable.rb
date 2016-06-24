module Filterable extend ActiveSupport::Concern
	module ClassMethods
		# Filter for searching each scope
		# Params:
		# + filter_params : a hash, key is method, value is params
		def filter(filter_params)
			result = self.where(nil) # Creates an anonymous scope
			filter_params.each do |key, value|
				result = result.public_send(key, value) if value.present?
			end
			result
		end
	end
end
