Rails.application.routes.draw do
  
  get 'welcome/index'

  get 'others/index', to: 'others#index'

  resources :articles do
    resources :comments
  end

  root :to => "welcome#index"
end
