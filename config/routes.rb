Rails.application.routes.draw do
  resources :posts, :except => [:show]

  root "posts#index"
  get 'busca', to:'busca#index'
  get 'busca/search', to: 'busca#search'
end
