class TodoItem < ActiveRecord::Base
  belongs_to :todo_list
  has_and_belongs_to_many :tags

  default_scope { order due_date: :asc }

  def done?
    if done
      "Done"
    else
      "Not done"
    end
  end
end
