print "Destroy cities.........."
City.destroy_all
puts "End"

print "Destroy Categories.........."
Category.destroy_all
puts "End"

print "Destroy Job Application.........."
JobApplication.destroy_all
puts "End"

print "Destroy Jobs............."
Job.destroy_all
puts "End"

print "Destroy Employee..........."
Employee.destroy_all
puts

print "Destroy Employer............"
Employer.destroy_all
puts "End"

print "Destroy Admin............."
AdminUser.destroy_all
puts "End"

cities = [{ name: 'Hồ Chí Minh' },
          { name: 'Hà Nội' },
          { name: 'Đà Nẵng' },
          { name: 'Cần Thơ' }]

10.times do
  City.create(name: Faker::Address.city)
end

Employee.create(email: "abc@xyz.com", password: "123456", password_confirmation: "123456")
Employer.create(email: "abc@xyz.com", password: "123456", password_confirmation: "123456",name: "FPT software")

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

20.times do
  name = Faker::Commerce.department(1)
  Category.create(name: name)
end

(1..50).each do |i|
  employer_id = i % 10 + 1
  name = Faker::Name.title
  paragraph = Faker::Lorem.paragraph

  job = Job.create(employer_id: employer_id, name: name, detail: paragraph, requirement: paragraph, offer: paragraph)

  (1..4).each do |j|
    job.categories << Category.find((j + i) % 20 + 1)
  end
end

(1..20).each do |i|
  employee_id = i % 10 + 1
  job_id = i
  JobApplication.create(employee_id: employee_id, job_id: job_id)
end

AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')