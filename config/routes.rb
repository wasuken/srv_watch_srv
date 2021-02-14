Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'servers/index'
      get 'server_logs/index'
      post 'server_logs/create'
    end
  end
  get 'server_logs/index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
