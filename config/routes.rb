Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :cages, defaults: { format: 'json' } 
      resources :dinosaurs, defaults: { format: 'json' }
      resources :species, defaults: { format: 'json' }  
    end
  end
end
