Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'

  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: "omniauth_callbacks" }

  devise_scope :user do
    get '/users/auth/:provider/upgrade', :to => 'omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
  end
    get '/users/auth/:provider/setup', :to => 'omniauth_callbacks#setup'

end
