Rails.application.routes.draw do
  root 'home#index'
  
  resources :sales, except: [:show, :new, :create, :edit, :update]  do
    post :import, on: :collection
  end
end
