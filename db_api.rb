require_relative 'student'
require_relative 'course'
require 'yaml'

class DbApi
  def self.method_missing (method, *args)
    @@students ||= YAML.load_file 'university_db.yml'
    student_attribute = method.to_s.split('where_').last
    @@students.select { |student| student.send(student_attribute).send("#{args[0]}", args[1]) }
  end
end