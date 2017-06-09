Rails.application.routes.draw do

  resources :passwords, controller: "clearance/passwords", only: [:create, :new]
  resource :session, controller: "clearance/sessions", only: [:create]

  resources :users, controller: "users", only: [:create] do
    resource :password,
      controller: "clearance/passwords",
      only: [:create, :edit, :update]
  end

  # get "/sign_in" => "clearance/sessions#new", as: "sign_in"
  delete "/sign_out" => "clearance/sessions#destroy", as: "sign_out"

  resources :companies, only: [:edit, :index, :show, :update]

  resources :versions, only: [:index]

  get "/thank_you" => "companies#thankyou", as: "thank_you"

  post "/versions/:id/approve" => "versions#approve", as: "version_approve"

  get "/welcome" => "users#welcome", as: "welcome"

  root 'users#welcome'
end
