Rails.application.routes.draw do
  devise_for :users

  resource :user, only: [ :show, :edit, :update ] do
    patch :toggle_visibility, on: :collection
    patch :toggle_reminder_email_opt_in, on: :collection
  end

  resources :challenges do
    member do
      get "day/:date", action: :show_by_date, as: :day
      post "join", to: "challenges#join", as: "join"
      delete "leave", to: "challenges#leave", as: "leave"
      post "set_primary", to: "challenges#set_primary"
      post "remove_primary", to: "challenges#remove_primary"
    end

    collection do
      get "public", to: "challenges#public_index", as: "public"
    end

    resources :logs, only: [ :create, :index, :destroy ] do
      collection do
        delete "reset_logs", to: "logs#reset_logs", as: "reset"
        post "catch_up", to: "logs#catch_up", as: "catch_up"
      end
    end
  end

  get "up" => "rails/health#show", as: :rails_health_check

  get "logs/all", to: "logs#index_all", as: "all_logs"

  authenticated :user do
    root "logs#index_all", as: :authenticated_root
  end

  unauthenticated do
    root "application#home", as: :unauthenticated_root
  end
end
