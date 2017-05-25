Rails.application.routes.draw do
  
  get "/" => "sessions#new" #1

  get "/products" => "products#index"

  get "/products/new" => "products#new"
 
  get "/products/:id" => "products#show" #how we are passing information
  
  post "/products" => "products#create" #takes place of new_product_results

  get "/products/:id/edit" => "products#edit"
  patch "/products/:id" => "products#update"

  delete "/products/:id" => "products#destroy"

  get "/products/:id/images/new" => "images#new"
  post "/products/:id/images" => "images#create"

  get "/signup" => "users#new"
  post "/users" => "users#create"

  get "/login" => "sessions#new"  #2 takes to sessions controller
  post "/login" => "sessions#create" #3 goes to sessions controller
  get "/logout" => "sessions#destroy"

  post '/orders' => 'orders#create'
  get '/orders/:id' => 'orders#show'
  patch '/orders/:id' => 'orders#update'

  get '/carted_products' => 'carted_products#index'
  post '/carted_products' => 'carted_products#create'
  delete '/carted_products/:id'=> 'carted_products#destroy'

 
end


