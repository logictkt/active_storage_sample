Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'top#index'

  resources :up_files, only: [:index, :new, :create, :show] do
    member do
      post :download
    end
  end
end
