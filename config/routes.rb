Rails.application.routes.draw do
  root to: 'cocktails#index'


  resources :cocktails, except: [:index] do
    resources :doses, only: [:index, :new, :create]
  end
  resources :doses, only: [:show, :edit, :update, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
