Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :menus do
    resources :days, except: :destroy do
      resources :repas, except: :show do
        resources :plats do
          resources :ingredients, only: [:new, :create, :edit, :update, :show, :destroy]
        end
      end
    end
    resources :todos
    resources :ingredients, only: :index
    resources :repas, only: :show
  end
end
