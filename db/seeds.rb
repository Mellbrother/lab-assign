# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
10.times do |i|
	tmp = Faker::Name.name
	User.create(
		name: tmp,
		email: "teacher#{i}@example.com",
		admin: false,
		teacher: true,
		password: "password",
		password_confirmation: "password"
	)
	Teacher.create(
		mynumber: 157000 + i,
		name: tmp
	)
end

100.times do |i|
	tmp = Faker::Name.name
	User.create(
		name: tmp,
		email: "student#{i}@example.com",
		admin: false,
		student: true,
		password: "password",
		password_confirmation: "password"
	)
	Student.create(
		mynumber: 155000 + i,
		name: tmp,
		gpa: rand(1.5..3.9).floor(2),
		gp: rand(100..400)
	)
end	
User.create(
		name: "admin",
		email: "admin@example.com",
		admin: true,
		password: "password",
		password_confirmation: "password"
)