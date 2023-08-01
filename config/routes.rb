Rails.application.routes.draw do
  resources :devs, :except => [:show]
  resources :posts, :except => [:show]
  get 'export', to: 'export#index'
  root "posts#index"
  get 'busca', to:'busca#index'
  get 'busca/search', to: 'busca#search'

  delete 'posts', to: 'posts#destroy_multiple', as: :destroy_multiple

   get 'export/search', to: 'export#search'

end
