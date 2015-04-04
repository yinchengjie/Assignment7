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

account = Account.find_by gender: "male", age: 52, first_name: "Viktor", last_name: "Yurishenko"
viktor.account = account

# Retrieving TodoList records
list1 = TodoList.find_by list_name: "Business trip to New York City", list_due_date: "2015-09-23"
list2 = TodoList.find_by list_name: "Vacation to Disney Land", list_due_date: "2015-07-01"

# Retrieving TodoItem records
item1 = TodoItem.find_by due_date: "2015-04-15", task_title: "Buy tickets", description: "Buy tickets to Disney Land online"
item2 = TodoItem.find_by due_date: "2015-05-01", task_title: "Reserve hotel", description: "Reserve hotel for two adults and two children"
item3 = TodoItem.find_by due_date: "2015-06-01", task_title: "Bring the car to mechanic", description: "Oil change and maintenance"
item4 = TodoItem.find_by due_date: "2015-03-28", task_title: "Buy plane tickets", description: "Buy round-trip plane tickets online"
item5 = TodoItem.find_by due_date: "2015-04-04", task_title: "Reserve hotel", description: "Reserve hotel for one adult"
item6 = TodoItem.find_by due_date: "2015-04-05", task_title: "Buy Broadway show ticket", description: "Buy Broadway show ticket online"

# Retrieving Tag records
tag1 = Tag.find_by tag_name: "vacation"
tag2 = Tag.find_by  tag_name: "business trip"
tag3 = Tag.find_by tag_name: "entertainment"
tag4 = Tag.find_by tag_name: "hotel"

puts "-----------------------------------------------------------------------\n"

# Demonstrating that TodoItem records are mapped directly to the User record
# Note that in the output the TodoItem records are retrieved in ascending order
# as defined in default scope.
puts "Demonstrating that TodoItem records are mapped directly to the User record"

list1.todo_items << [ item1, item2, item3 ]

list2.todo_items << [ item4, item5, item6 ]

viktor.todo_lists << [ list1, list2 ]

puts viktor.todo_list_items.inspect
puts "\n"
puts viktor.todo_list_items.pluck(:due_date, :task_title, :description)

puts "-----------------------------------------------------------------------\n"

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

puts "-----------------------------------------------------------------------\n"

# Demonstrating TodoList records are retrieved in ascending order by date by default
puts "Demonstrating TodoList records are retrieved in ascending order by date by default"
puts TodoList.pluck(:list_due_date)

puts "-----------------------------------------------------------------------\n"

# Demonstrating TodoList records are retrieved 'unscoped'
puts "Demonstrating TodoList records are retrieved 'unscoped'"
puts TodoList.unscoped.pluck(:list_due_date)

puts "-----------------------------------------------------------------------\n"

# Demonstrating TodoItem records are retrieved in ascending order by date by default
puts "Demonstrating TodoItem records are retrieved in ascending order by date by default"
puts TodoItem.pluck(:due_date)

puts "-----------------------------------------------------------------------\n"

# Demonstrating TodoItem records are retrieved 'unscoped'
puts "Demonstrating TodoItem records are retrieved 'unscoped'"
puts TodoItem.unscoped.pluck(:due_date)

puts "-----------------------------------------------------------------------\n"

# test relationship between User and Account
User.first.account = Account.first
puts User.first.account.inspect

# test relationship between TodoItems and Tag
TodoItem.first.tags << Tag.first
puts Tag.first.todo_items.inspect

Tag.second.todo_items << TodoItem.second
puts Tag.second.todo_items.inspect

puts "-----------------------------------------------------------------------\n"

# Demonstrating one-to-one relationship between User and Account
puts "Demonstrating one-to-one relationship between User and Account"
account = Account.find_by gender: "male", age: 52, first_name: "Viktor", last_name: "Yurishenko"
viktor.account = account
puts viktor.inspect
puts viktor.account.inspect

puts "-----------------------------------------------------------------------\n"

# Demonstrating one-to-many relationship between User and TodoList
puts "Demonstrating one-to-many relationship between User and TodoList"
puts viktor.inspect
puts viktor.todo_lists.inspect
puts "\n"
puts viktor.todo_lists.pluck(:list_due_date, :list_name)

puts "-----------------------------------------------------------------------\n"

# Demonstrating one-to-many relationship between TodoList and TodoItem
puts "Demonstrating one-to-many relationship between TodoList and TodoItem"
puts list2.inspect
puts list2.todo_items.inspect
puts "\n"
puts list2.todo_items.pluck(:due_date, :task_title, :description)
puts "-----------------------------------------------------------------------\n"


# Demonstrating many-to-many relatioship between TodoItem and Tag
puts "Demonstrating many-to-many relatioship between TodoItem and Tag"
item4.tags.clear
item4.tags << [ tag1, tag2 ]

tag1.todo_items.clear
tag1.todo_items << [ item1, item2 ]

puts item4.inspect
puts "\n"
puts item4.tags.inspect
puts "\n"
puts "\n"


puts tag1.inspect
puts "\n"
puts tag1.todo_items.inspect
puts "\n"

puts "-----------------------------------------------------------------------\n"
