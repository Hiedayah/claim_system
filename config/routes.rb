Rails.application.routes.draw do
  root 'claims#index'
  resources :settings
  resources :expenses
  resources :claims
  devise_for :staffs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
