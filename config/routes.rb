Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :repos, only: [:index, :create, :destroy, :update] do
    member do
      put 'vulnerability-alerts'
      put 'topics'
    end
  end
end
