module JobApplicationsHelper
	def send_to_employer(mail)
		file = mail[:employee_resume]
		MyMailer.apply_job_of_employer(mail, file).deliver_now
	end
end
