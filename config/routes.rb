Rails.application.routes.draw do
  
  get "/" => "products#index"

  get "/products" => "products#index"

 get "/products/new" => "products#new"
 
  get "/products/:id" => "products#show" #how we are passing information
  
  post "/products" => "products#create" #takes place of new_product_results

 get "/products/:id/edit" => "products#edit"

 patch "/products/:id" => "products#update"

 delete "/products/:id" => "products#destroy"

end


