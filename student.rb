class Student
  attr_accessor :student_id, :first_name, :last_name, :city, :state, :email, :gender, :pounds, :gpa, :taking_courses

  def initialize
    yield self if block_given?
  end

  def to_s
    "Student ID: #{student_id}; Name: #{first_name} #{last_name}; Hometown: #{city}, #{state}; Email: #{email}; Gender: #{gender}; Weight: #{pounds} lb; GPA: #{gpa} \n" +
        " Courses: " + taking_courses.join(", ")
  end
end