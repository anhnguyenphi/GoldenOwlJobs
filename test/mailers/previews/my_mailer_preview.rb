# Preview all emails at http://localhost:3000/rails/mailers/my_mailer
class MyMailerPreview < ActionMailer::Preview

	def apply_job_of_employer
		content = {employee_name: "Nguyen Van A",
							employee_email: "aaa@bbb.com",
							employee_resume: "Xxx",
							content: "Hi all",
							employer_id: 1, 
							job_id: 1}
		cv = File.read("#{Rails.root}/public/test.pdf")
		MyMailer.apply_job_of_employer(content, cv).deliver
	end
end
