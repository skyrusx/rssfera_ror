Rails.application.routes.draw do
  root "pages#index"

  # resources :pages, param: :slug, path: ''

  devise_for :admins, skip: [:sessions]
  devise_scope :admin do
    get "/login", to: "devise/sessions#new", as: :new_admin_session
    post "/login", to: "devise/sessions#create", as: :admin_session
    delete "/logout", to: "devise/sessions#destroy", as: :destroy_admin_session
  end

  resources :admin, only: :index
  namespace :admin do
    controller :admin do
      get '/', action: :index
    end

    resources :team_members do
      member do
        delete :delete_photo
      end
    end

    resources :reviews do
      member do
        delete :delete_avatar
      end
    end

    resources :partners do
      member do
        delete :delete_logo
      end
    end

    resources :realties do
      member do
        delete :delete_photo
      end
    end

    resources :job_titles
    resources :employment_types
    resources :skills
    resources :vacancies
    resources :social_links
    resources :contacts, only: [:show, :edit, :update]
    resources :realty_categories
    resources :cities
    resources :districts
    resources :streets
  end

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
