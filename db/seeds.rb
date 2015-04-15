# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
User.create [
                { login: "Matt", password: "abc123" },
                { login: "Tim", password: "abc123" },
            ]

Account.destroy_all
Account.create [
                   { gender: "male", age: 52, first_name: "Matt", last_name: "Yurishenko" },
                   { gender: "male", age: 36, first_name: "Tim", last_name: "Smith" },
               ]

matt  = User.find_by(login: "Matt")
tim = User.find_by(login: "Tim")
account_matt = Account.find_by(first_name: "Matt")
account_tim = Account.find_by(first_name: "Tim")
matt.account = account_matt
tim.account = account_tim

20.times do |index|
  todolist = TodoList.create(list_name: "Name#{index}", list_due_date: "2020-01-01")
  matt.todo_lists << todolist
end

