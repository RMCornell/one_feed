Rails.application.routes.draw do
  root 'welcome#index'
  get 'welcome/index'

  devise_for :users, class_name: 'FormUser', :controllers => { omniauth_callbacks: "omniauth_callbacks" }

end
