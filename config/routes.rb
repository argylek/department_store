Rails.application.routes.draw do
  # get 'departments/index'
  # get 'departments/show'
  # get 'departments/edit'
  # get 'departments/new'

  resources :departments
  root 'departments#index'

  resources :departments do
    resources :items
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
