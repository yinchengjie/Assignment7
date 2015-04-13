Rails.application.routes.draw do

  root to: "todo_lists#index"
  resources :todo_lists do
    resources :todo_items, only: [:create, :new, :destroy, :edit, :update, :show]
  end

  resource :sessions, only: [:create, :destroy, :new]

  controller :sessions do
    get 'login' => :new, as: 'login'
    post 'login' => :create
    delete 'logout' => :destroy, as: 'logout'
  end
end
