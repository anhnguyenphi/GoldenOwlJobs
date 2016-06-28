class EmployeesController < ApplicationController
	def apply
		ap = ApplyRelationship.new(apply_params)
		render plain: apply_params
	end

	private
		def apply_params
			params.permit(:employee_id, :job_id)
		end
end
