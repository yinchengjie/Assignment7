require 'csv'
require 'yaml'
require_relative 'student'
require_relative 'course'

COURSES = [Course.new("Foundations of Algorithms", "EN.605.421"),
           Course.new("Rich Internet Applications with Ajax", "EN.605.787"),
           Course.new("XML: Design Paradigms", "EN.605.444"),
           Course.new("Agile Development with Ruby on Rails", "EN.605.484")]

students = []
id = 0
CSV.foreach("students.csv", headers: true) do |row|
  id += 1
  student = Student.new do |student|
    student.student_id = id
    student.first_name = row["GivenName"]
    student.last_name = row["Surname"]
    student.city = row["City"]
    student.state = row["State"]
    student.email = row["EmailAddress"]
    student.gender = row["Gender"]
    student.pounds = row["Pounds"].to_f
    student.gpa = rand(2.0 .. 4.0).round(2)
    student.taking_courses = COURSES.sample(rand(0 .. 4))
  end
  students << student
end

File.open("university_db.yml", "w") {|f| YAML.dump(students, f)}
