# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
User.create [
                { login: "viktor", password: "1234567" },
                { login: "johnSmith", password: "abcdefg" },
            ]

Account.destroy_all
Account.create [
                   { gender: "male", age: 52, first_name: "Viktor", last_name: "Yurishenko" },
                   { gender: "male", age: 36, first_name: "John", last_name: "Smith" },
               ]

TodoList.destroy_all
TodoList.create [
                    { list_name: "Vacation to Disney Land", list_due_date: "2015-07-01" },
                    { list_name: "Business trip to New York City", list_due_date: "2015-09-23" },
                ]

TodoItem.destroy_all
TodoItem.create [
                    { due_date: "2015-04-15", task_title: "Buy tickets", description: "Buy tickets to Disney Land online" },
                    { due_date: "2015-05-01", task_title: "Reserve hotel", description: "Reserve hotel for two adults and two children" },
                    { due_date: "2015-06-01", task_title: "Bring the car to mechanic", description: "Oil change and maintenance" },
                    { due_date: "2015-03-28", task_title: "Buy plane tickets", description: "Buy round-trip plane tickets online" },
                    { due_date: "2015-04-04", task_title: "Reserve hotel", description: "Reserve hotel for one adult" },
                    { due_date: "2015-04-05", task_title: "Buy Broadway show ticket", description: "Buy Broadway show ticket online"},
                ]

Tag.destroy_all
Tag.create [
               { tag_name: "vacation" },
               { tag_name: "business trip" },
               { tag_name: "entertainment" },
               { tag_name: "hotel" },
           ]