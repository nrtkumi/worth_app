Rails.application.routes.draw do
  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  resources :users, only: [:index, :show, :edit, :update]
  resources :projects
  post 'like/:project_id' => 'likes#like', as: 'like'
  delete 'unlike/:project_id' => 'likes#unlike', as: 'unlike'
  root 'top#home'

end
