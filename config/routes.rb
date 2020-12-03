Rails.application.routes.draw do
  namespace "api" do
    namespace "v1" do
      resources :users, only: [:create, :show, :index]
      resources :notes, only: [:create, :update, :delete, :index, :show]
      post "/login", to: "sessions#create"
      delete "/logout", to: "sessions#destroy"
      get "/logged_in", to: "sessions#is_logged_in?"
    end
  end
end
