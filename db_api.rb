require_relative 'student'
require_relative 'course'
require 'yaml'

class DbApi
  def self.students
    YAML.load_file 'university_db.yml'
  end

  def self.select_by_gender	(gender)
    @@students ||= self.students
    @@students.select { |student| student.gender == gender }
  end

  def	self.select_by_first_name	(first_name)
    @@students ||= self.students
    @@students.select { |student| student.first_name =~ first_name }
  end

  def	self.select_by_last_name	(last_name)
    @@students ||= self.students
    @@students.select { |student| student.last_name =~ last_name }
  end

  def	self.select_by_weight_more_than(pounds)
    @@students ||= self.students
    @@students.select { |student| student.pounds > pounds }
  end
end
