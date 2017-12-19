Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root :to => "rovers#index"
  resources :rovers, :only => [:index] do
    collection do
      post "move"
    end
  end
end
