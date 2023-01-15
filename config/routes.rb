Rails.application.routes.draw do
  root 'lists#index'
  resources :lists, except: [:edit, :update, :destroy] do
    resources :bookmarks, only: [:new, :create]
  end
  get 'delete_list/:id', to: 'lists#destroy', as: 'delete_list'
  get 'delete_bookmarks/:id', to: 'bookmarks#destroy', as: 'delete_bookmark'
  resources :bookmarks, only: :destroy
end
