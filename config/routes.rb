Rails.application.routes.draw do
  
  get "/" => "posts#index"
  
  get "/posts/new" => "posts#new"
  
  get "posts/:id" => "posts#show"
  get "posts/:id/edit" => "posts#edit"
  post "posts/create" => "posts#create"
  
  post "posts/:id/update" => "posts#update"
  post "posts/:id/destroy" => "posts#destroy"
  
  get 'search', to: 'posts#search'


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
