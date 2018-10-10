Rails.application.routes.draw do
  root 'claims#index'
  resources :settings
  resources :expenses
  resources :claims do 
  	member do 
  		get :print_claim
  		put :submit
  		put :verify
  		put :approve
      put :return_by_verifier
      put :return_by_approver
  		end 
  end
  devise_for :staffs
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
