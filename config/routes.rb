Rails.application.routes.draw do
  devise_for :users
  
  root to: "galleries#index"

  resources :restaurants do
    resource :menu, only: [:show, :new, :create] do
      resources :dishes, only: [:index, :new, :create]
    end
    resources :galleries, only: [:index, :new, :create]
  end

  resources :galleries do
    member do
      delete :remove_attachment
    end
  end

  resources :dishes, only: [:show, :edit, :update, :destroy]

  get "up" => "rails/health#show", as: :rails_health_check
end
