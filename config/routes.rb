ChirrinChirrionAdmin::Engine.routes.draw do
  resources :toggles , only: [:index, :new, :create, :destroy]

  put 'toggles/chirrin/:id', to: 'toggles#chirrin', as: 'chirrin_toggle'

  put 'toggles/chirrion/:id', to: 'toggles#chirrion', as: 'chirrion_toggle'

  root to: 'toggles#index'
end
