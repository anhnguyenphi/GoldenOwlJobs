class MyMailer < Devise::Mailer 
  # mail to employer
  def apply_job_of_employer(mail)
  	@employer = Employer.find(mail[:employer_id])
    @employee = Employee.find(mail[:employee_id])
    @job = Job.find(mail[:job_id])
  	# @content has :employee_name, :employee_email, :content
  	@content = mail
  
    email_with_name = %("#{@employee.first_name}" <#{@employee.email}>)

    cv = mail[:employee_resume]
  	attachments["#{cv.original_filename}"] = File.read(cv.path)

  	mail(from: email_with_name,
  			 to: @employer.email,
  			 subject: "Apply for #{@job.name}")
  end
end
