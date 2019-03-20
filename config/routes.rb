Rails.application.routes.draw do
  mount ForestLiana::Engine => '/forest'
  devise_for :users, :controllers => { registrations: 'registrations' }
  root to: 'pages#home'
  get '/about' => 'pages#about'
  resources :menus do
    post :duplicate_menu, on: :member
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
