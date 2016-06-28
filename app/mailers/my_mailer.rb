class MyMailer < Devise::Mailer 
  # mail to employer
  def apply_job_of_employer(mail, cv)
  	@employer = Employer.find(mail[:employer_id])
  	# @content has :employee_name, :employee_email, :employee_resume, :content
  	@content = mail
  	@job = Job.find(mail[:job_id])

  	attachments["#{cv.original_filename}"] = File.read(cv.path)

  	mail(from: @content[:employee_email],
  			 to: @employer.email,
  			 subject: "Apply for #{@job.name}")
  end
end
