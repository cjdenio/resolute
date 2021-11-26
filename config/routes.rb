Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: 'landing#index'

  get 'signup', to: 'signup#index'
  post 'signup', to: 'signup#submit'
  get 'verify', to: 'signup#verify'
  post 'verify', to: 'signup#finalize'

  get 'forgot-password', to: 'auth#forgot_password'

  scope '/callback' do
    get 'github', to: 'oauth_callback#github'
    get 'twitter', to: 'oauth_callback#twitter'
  end

  scope '/login' do
    get '/', to: 'auth#login'
    post '/', to: 'auth#auth'

    get 'twitter', to: 'oauth_login#twitter'
    get 'github', to: 'oauth_login#github'
  end

  get 'logout', to: 'auth#logout'

  get 'home', to: 'reminders#index'
  resources :reminders, except: [:show]

  scope '/developer' do
    resources :oauth_apps, path: 'apps' do
      member do
        get 'advanced'
      end
    end
  end

  namespace :api do
    get 'oauth/authorize', to: 'oauth#authorize'
  end
end
