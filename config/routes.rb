Rails.application.routes.draw do
  get 'welcome/index'
  
  resources :articles

  root :to => "welcome#index"
end
