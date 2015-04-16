class TodoList < ActiveRecord::Base
  belongs_to :user
  has_many :todo_items

  validates :list_name, presence: true

  default_scope { order list_due_date: :asc }

  def all_done?
    all_done = true
    todo_items.each do |todo_item|
      if !todo_item.done
        all_done = false
        break
      end
    end
    all_done
  end
end
