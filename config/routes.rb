ChirrinChirrionAdmin::Engine.routes.draw do
  resources :toggles , only: [:index, :new, :create, :destroy]

  put 'toggles/acivate', to: 'toggles#activate'

  put 'toggles/inactivate', to: 'toggles#inactivate'

  root to: 'toggles#index'
end
