Rails.application.routes.draw do
  resources :posts

  root "posts#index"
  get 'busca', to:'busca#index'
  get 'busca/search', to: 'busca#search'
end
