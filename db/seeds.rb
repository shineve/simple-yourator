# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

10.times do
  company = Company.new
  company.name = Faker::Company.name
  company.code = Faker::Company.russian_tax_number
  company.description = Faker::Lorem.paragraphs(number: rand(4..8)).map { |pr| "<p>#{pr}</p>" }.join
  company.mission = Faker::Lorem.paragraphs(number: rand(4..8)).map { |pr| "<p>#{pr}</p>" }.join
  company.benefits = Faker::Lorem.paragraphs(number: rand(4..8)).map { |pr| "<p>#{pr}</p>" }.join
  company.save
end

companies = Company.all
companies.each do |company|
  rand(5..15).times do
    company.jobs.create(
      title: Faker::Job.title,
      company_id: company.id,
      description: Faker::Lorem.paragraphs(number: rand(4..8)).map { |pr| "<p>#{pr}</p>" }.join,
      requirements: Faker::Lorem.paragraphs(number: rand(4..8)).map { |pr| "<p>#{pr}</p>" }.join,
      employee_benefits: Faker::Lorem.paragraphs(number: rand(4..8)).map { |pr| "<p>#{pr}</p>" }.join,
      min_salary: Faker::Number.between(from: 100_000, to: 150_000),
      max_salary: Faker::Number.between(from: 200_000, to: 300_000),
      currency: 'TWD'
    )
  end
end
