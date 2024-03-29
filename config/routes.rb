Rails.application.routes.draw do
  get "401", to: "errors#unauthorized", as: :unauthorized_error
  get "403", to: "errors#forbidden", as: :forbidden_error
  get "404", to: "errors#not_found", as: :not_found_error
  get "406", to: "errors#not_acceptable", as: :not_acceptable_error
  get "422", to: "errors#unprocessable_entity", as: :unprocessable_entity_error
  get "500", to: "errors#internal_server_error", as: :internal_server_error_error

  namespace :admin do
    resource :camp, only: [:show]

    resources :camp_applications do
      member do
        patch :active
        patch :approve
        patch :complete
        patch :reject
        patch :restore
        delete :force_delete
      end
    end

    resources :camp_interviews do
      member do
        patch :approve
        patch :assign
        patch :complete
        patch :reject
        patch :restore
        delete :force_delete
      end
    end

    resources :newsletters do
      collection do
        get :export
      end

      member do
        patch :restore
        patch :unsubscribe
      end
    end

    resources :pages, only: [] do
      collection do
        get :system
      end
    end

    resources :users do
      member do
        patch :restore
        patch :remove_avatar
      end
    end

    root to: "pages#home"
  end

  resources :camp_applications, except: [:destroy]

  resources :guides, only: [:index] do
    collection do
      get :power
      get :shipping_container
    end
  end

  resources :newsletters do
    member do
      patch :unsubscribe
    end
  end

  resources :pages, only: [] do
    collection do
      get :contact
      get :events
      get :history
    end
  end

  devise_for :users, controllers: {
    confirmations: "users/confirmations",
    omniauth_calbacks: "users/omniauth_callbacks",
    passwords: "users/passwords",
    registrations: "users/registrations",
    sessions: "users/sessions",
    unlocks: "users/unlocks"
  }

  resources :users, only: [:index, :show]

  root to: "pages#home"
end
