Rails.application.routes.draw do
  resources :devs
  resources :posts, :except => [:show]
  get 'export_excel', to: 'export_excel#export', as: :export_excel
  root "posts#index"
  get 'busca', to:'busca#index'
  get 'busca/search', to: 'busca#search'
end
