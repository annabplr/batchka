Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  get '/about' => 'pages#about'
  resources :menus do
    resources :days, except: :destroy do
      resources :repas, except: [:show, :index] do
        resources :plats do
          resources :ingredients, only: [:new, :create, :edit, :update, :show, :destroy]
        end
      end
    end
    resources :todos
    resources :ingredients, only: :index
    resources :repas, only: [:show, :index]
  end
end
