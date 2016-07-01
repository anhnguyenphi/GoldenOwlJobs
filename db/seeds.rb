# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cities = [{name: 'Hồ Chí Minh'},
					{name: 'Hà Nội'},
					{name: 'Đà Nẵng'},
					{name: 'Cần Thơ'}]

cities.each do |city|
	City.create(city)
end

Employee.create(email: "lta.anluu@gmail.com", password: "123456", password_confirmation: "123456")
Employer.create(email: "lta.anluu@gmail.com", password: "123456", password_confirmation: "123456",name: "AnLuu Company")

(1..10).each do |i|
  email = Faker::Internet.email
  password = "123456"
  Employee.create(email: email, password: password, password_confirmation: password)
end

(1..10).each do |i|
  email = Faker::Internet.email
  password = "123456"
  name = Faker::Company.name
  Employer.create(name: name, email: email, password: password, password_confirmation: password)
end

(1..50).each do |i|
  employer_id = i % 10 + 1
  name = Faker::Name.title
  paragraph = Faker::Lorem.paragraph

  Job.create(employer_id: employer_id, name: name, detail: paragraph, requirement: paragraph, offer: paragraph)
end

(1..20).each do |i|
  employee_id = i % 10 + 1
  job_id = i
  JobApplication.create(employee_id: employee_id, job_id: job_id)
end
