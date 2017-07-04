Rails.application.routes.draw do
    root to: 'campaigns#index'
    
    get 'registration', to: 'campaigns#new'
    post 'registration', to: 'campaigns#create'

    get 'registration_cuepoint', to: 'cuepoint#new'
    post 'registration_cuepoint', to: 'cuepoint#create'

    get 'results', to: 'results#index'
    get 'results/record'

    resources :campaigns
    resources :cuepoint do
      resources :campaigns, only: [:index]
    end

    resources :campaign_cuepoints
end
