Rails.application.routes.draw do
  resources :xml_documents
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "xml_documents#index"
end
