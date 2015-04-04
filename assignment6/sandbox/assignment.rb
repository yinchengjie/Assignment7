require_relative '../config/environment'

viktor = User.find_by login: 'viktor'

todoList = TodoList.first
todoList.user = viktor
todoItem = TodoItem.first
todoItem.todo_list = todoList

puts viktor.todo_list_items.inspect

#test min age
puts Account.create(gender: "female", age: 12, first_name: "Sabrina", last_name: "Richie").errors.full_messages

# test max age
puts Account.create(gender: "female", age: 120, first_name: "Sabrina", last_name: "Richie").errors.full_messages

# test gender text
puts Account.create(gender: "balbla", age: 21, first_name: "Sabrina", last_name: "Richie").errors.full_messages

<<<<<<< HEAD

# Mapping up a User record with an Account record
account = Account.find_by gender: "male", age: 52, first_name: "Viktor", last_name: "Yurishenko"
viktor.account = account

# Retrieving TodoList records
list1 = TodoList.find_by list_name: "Vacation to Disney Land", list_due_date: "2015-07-01"
list2 = TodoList.find_by list_name: "Business trip to New York City", list_due_date: "2015-09-23"

# Retrieving TodoItem records
item1 = TodoItem.find_by due_date: "2015-04-15", task_title: "Buy tickets", description: "Buy tickets to Disney Land online"
item2 = TodoItem.find_by due_date: "2015-05-01", task_title: "Reserve hotel", description: "Reserve hotel for two adults and two children"
item3 = TodoItem.find_by due_date: "2015-06-01", task_title: "Bring the car to mechanic", description: "Oil change and maintenance"
item4 = TodoItem.find_by due_date: "2015-03-28", task_title: "Buy plane tickets", description: "Buy round-trip plane tickets online"
item5 = TodoItem.find_by due_date: "2015-04-04", task_title: "Reserve hotel", description: "Reserve hotel for one adult"
item6 = TodoItem.find_by due_date: "2015-04-05", task_title: "Buy Broadway show ticket", description: "Buy Broadway show ticket online"

# Mappying TodoItem records to TodoList records
list1.todo_items << [ item1, item2, item3 ]
list2.todo_items << [ item4, item5, item6 ]

# Mappying TodoList records to the User record
TodoList.all.each do |list|
  viktor.todo_lists << list
end

puts "\n"

# Demonstrating that TodoItem records are mapped directly to the User record
# Note that in the output the TodoItem records are retrieved in ascending order
# as defined in default scope.
puts "Demonstrating that TodoItem records are mapped directly to the User record"
puts "#{viktor.account.first_name} #{viktor.account.last_name}'s To-do Items"
viktor.todo_list_items.each do |item|
  puts "Due Date: #{item.due_date}.  Task Title: #{item.task_title}.  Description: #{item.description}."
end

puts "\n"

# Demonstrating validations on gender and age
puts "Demonstrating validations on gender and age"
a1 = Account.create gender: "neutral", age: 19
puts 'Statement:  a1 = Account.create gender: "neutral", age: 19'
puts "a1 is valid:  #{a1.valid?}"
puts "Error messages:  #{a1.errors.messages} \n\n"

a2 = Account.create gender: "neutral", age: 101
puts 'Statement:  a2 = Account.create gender: "neutral", age: 101'
puts "a2 is valid:  #{a2.valid?}"
puts "Error messages:  #{a2.errors.messages} \n\n"

a3 = Account.create gender: "female", age: 30
puts 'Statement:  a3 = Account.create gender: "female", age: 30'
puts "a3 is valid:  #{a3.valid?}"
puts "Error messages:  #{a3.errors.messages} \n\n"

a4 = Account.create gender: "male", age: 30
puts 'Statement:  a4 = Account.create gender: "male", age: 30'
puts "a4 is valid:  #{a4.valid?}"
puts "Error messages:  #{a4.errors.messages} \n\n"

a5 = Account.create gender: "N/A", age: 30
puts 'Statement:  a5 = Account.create gender: "N/A", age: 30'
puts "a5 is valid:  #{a5.valid?}"
puts "Error messages:  #{a5.errors.messages} \n\n"


# Demonstrating TodoList records are retrieved in ascending order by default
puts "Demonstrating TodoList records are retrieved in ascending order by default"
TodoList.destroy_all
TodoList.create list_due_date: "2015-12-24", list_name: "Chrismas shopping"
TodoList.create list_due_date: "2015-11-27", list_name: "Black Friday shopping"
TodoList.create list_due_date: "2015-02-14", list_name: "Valentine shopping"
TodoList.all.each do |list|
  puts "List Due Date: #{list.list_due_date}.  List Name: #{list.list_name}."
end


puts "\n"

# Demonstrating TodoItem records are retrieved in ascending order by default
puts "Demonstrating TodoItem records are retrieved in ascending order by default"
TodoItem.destroy_all
TodoItem.create due_date: "2015-12-24", task_title: "Buy Chrismas presents", description: "Buy Chrismas presents from Amazon.com"
TodoItem.create due_date: "2015-11-27", task_title: "Buy stuff on sale", description: "Buy stuff on sale from Amazon.com"
TodoItem.create due_date: "2015-02-14", task_title: "Buy Valentine present", description: "Buy Valentine present from Amazon.com"
TodoItem.all.each do |item|
  puts "Due Date: #{item.due_date}.  Task Title: #{item.task_title}.  Description: #{item.description}."
end
=======
# test relationship between User and Account
User.first.account = Account.first
puts User.first.account.inspect

# test relationship between TodoItems and Tag
TodoItem.first.tags << Tag.first
puts Tag.first.todo_items.inspect

Tag.second.todo_items << TodoItem.second
puts Tag.second.todo_items.inspect
>>>>>>> 216cb3307bdc6a3b92067e73471ccfb2be03ff5b

