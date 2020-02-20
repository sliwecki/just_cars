Rails.application.routes.draw do

  root 'application#info'

  # user namespace
  namespace :v1 do
    post 'user_token' => 'user_token#create'
    resources :offers, only: [:index, :show, :create]
  end

  # admin namespace
  namespace Settings.routes.admin_namespace do
    Sidekiq::Web.use Rack::Auth::Basic do |username, password|
      username == Settings.sidekiq.username &&
      password == Settings.sidekiq.password
    end
    mount Sidekiq::Web => '/sidekiq'
  end

  match '*path', to: 'application#routing_not_found', via: :all
end
