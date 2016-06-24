class SearchController < ApplicationController
	def show
		@search_key = search_params
		@job = Job.filter(search_params)
	end


	private
		def search_params
			keyword = params[:search][:keyword]
			params.required(:search).permit(:categories => [], :cities => []).merge(
																						:job_name => keyword,
																						:employer => keyword
																							)
		end
end
