Rails.application.routes.draw do
  # get 'rooms/index'

  # get 'rooms/show'

  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  resources :users, only: [:index, :show, :edit, :update]
  resources :projects do
    collection do
      get :search
      get :category
    end
    member do
      get :chat
    end
  end
  post 'like/:project_id' => 'likes#like', as: 'like'
  delete 'unlike/:project_id' => 'likes#unlike', as: 'unlike'
  get 'search' => 'top#search'
  post 'message' => 'messages#hello_world'
  root 'top#home'

end
