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
