module ApplicationHelper
  def due_date(todo_list, attributes = {})

    if todo_list.all_done?
      attributes[:style] = "background: greenyellow; padding: 10px; border-radius: 15px; font-size: 1.7em;"
    else
      attributes[:style] = "background: red; padding: 10px; border-radius: 15px; font-size: 1.7em;"
    end
    content_tag(:span, "#{todo_list.list_due_date}", attributes)
  end
end
