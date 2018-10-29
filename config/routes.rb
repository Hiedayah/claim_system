Rails.application.routes.draw do
  #get 'staff_records/index'
  resources :staff_records do
    member do
      get 'change_role'
    end
  end
  root 'claims#index'
  resources :settings
  resources :expenses
  resources :claims do 
    collection do
      get 'create_claim'
    end
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

  get "switch_to_admin/",            to: "application#switch_to_admin"
  get "switch_to_normal_user/",      to: "application#switch_to_normal_user"
  #get "change_role/",          to: "application#change_role"

  #get 'switch_to_admin/', to: "application#switch_to_admin"
  #get 'switch_to_normal_user/' , to: "switch_to_normal_user"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
