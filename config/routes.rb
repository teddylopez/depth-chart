Rails.application.routes.draw do
  get 'players/:id/show', action: :show, controller: 'players', as: 'player_show'
  get 'show', action: :show, controller: 'charts'
  get 'edit', action: :edit, controller: 'charts'
  delete 'charts/', action: :delete, controller: 'charts'
  post 'charts/1/update', controller: 'charts', action: :update
  patch 'charts/1/update', controller: 'charts', action: :update

  root 'charts#show'
end
