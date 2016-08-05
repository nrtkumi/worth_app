Rails.application.routes.draw do

  devise_for :users, controllers: { :omniauth_callbacks => "omniauth_callbacks" }
  resources :users, only: [:index, :show, :edit, :update]
  resources :projects do
    collection do
      get :search
      get :category
    end
    member do
      get :chat
      post 'message' => 'messages#chat'
    end
  end
  post 'like/:project_id' => 'likes#like', as: 'like'
  delete 'unlike/:project_id' => 'likes#unlike', as: 'unlike'
  get 'search' => 'top#search'
  get 'chat-list', to: 'projects#chatlist'
  get 'new_projects' => 'projects#new_projects'
  get 'pick_up' => 'projects#pick_up'
  get "bad_request" => "top#bad_request"
  get "internal_server_error" => "top#internal_server_error"
  root 'top#home'
  match "*anything" => "top#not_found", via: [:get, :post, :patch, :delete]
end
