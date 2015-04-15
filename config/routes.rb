Rails.application.routes.draw do

  root to: "todo_lists#index"
  resources :todo_lists do
    resources :todo_items, only: [:create, :new, :destroy, :edit, :update, :show]
  end

  resource :account, only: [:show, :edit, :update]

  resource :sessions, only: [:create, :destroy, :new]

  get '/login' => "sessions#new", as: "login"
  delete '/logout' => "sessions#destroy", as: "logout"

end
