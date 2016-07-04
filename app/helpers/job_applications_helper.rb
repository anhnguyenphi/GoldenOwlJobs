module JobApplicationsHelper
	def send_to_employer(mail)
		emloyee = current_employee
		MyMailer.apply_job_of_employer(emloyee, mail).deliver_now
	end
end
