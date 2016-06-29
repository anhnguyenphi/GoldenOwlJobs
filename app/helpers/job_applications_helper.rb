module JobApplicationsHelper
	def send_to_employer(mail)
		mail = mail.merge(:employee_id => current_employee.id)
		MyMailer.apply_job_of_employer(mail).deliver_now
	end
end
