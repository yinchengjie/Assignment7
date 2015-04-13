class User < ActiveRecord::Base
  has_secure_password
  has_one :account
  has_many :todo_lists
  has_many :todo_list_items, through: :todo_lists, source: :todo_items
end
