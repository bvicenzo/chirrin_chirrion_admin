ChirrinChirrionAdmin::Engine.routes.draw do
  resources :toggles , only: [:index, :new, :create, :destroy]

  put 'toggles/acivate/:id', to: 'toggles#activate', as: 'activate_toggle'

  put 'toggles/inactivate/:id', to: 'toggles#inactivate', as: 'inactivate_toggle'

  root to: 'toggles#index'
end
