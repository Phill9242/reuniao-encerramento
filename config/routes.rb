Rails.application.routes.draw do
  resources :devs, :except => [:show]
  resources :posts, :except => [:show]
  get 'export_excel', to: 'export_excel#export', as: :export_excel
  root "posts#index"
  get 'busca', to:'busca#index'
  get 'busca/search', to: 'busca#search'

  resources :posts do
    collection do
      delete 'destroy_multiple'
    end
  end
end
