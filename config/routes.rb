Rails.application.routes.draw do
    root to: 'campaigns#index'
    
    get 'new', to: 'campaigns#new'
    
    resources :campaign
    resources :cuepoints
    resources :results, only:[:index]
    resources :campaign_cuepoints
end
