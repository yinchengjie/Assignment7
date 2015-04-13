Rails.application.routes.draw do
  root to: "todo_lists#index"
  resources :todo_lists do
    resources :todo_items, only: [:create, :new, :destroy, :edit, :update, :show]
  end
end
