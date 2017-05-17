class ProductsController < ApplicationController
  
  def index
   @products = Product.all  #array of hashes
   sort_attribute = params[:sort] 
   sort_order = params[:order]
   discount = params[:discount]
   
   if sort_attribute && sort_order
      @products = Product.all.order(sort_attribute => sort_order)
    end

    if discount
      @products = Product.where("price < ?", 10)
    end

    render "index.html.erb"
  end
  
    def new
    render "new.html.erb"
    end


  def create
      Product.create(
        name: params[:name], 
        price: params[:price], 
        description: params[:description])

      # image = Image.create(
      # url: params[:url], 
      # product_id: params[:id])
      
      flash[:success] = "Product successfully created!" #flash[:success] is ruby
      redirect_to "/products/#{@product.id}"
  end


    def show
      @product = Product.find_by(id: params[:id]) #single hash. You can also use .find(recipe_id)

      if params[:id] == "random"
        @product = Product.all.sample
      end
      render "show.html.erb"
    end

  def edit
    @product = Product.find_by(id: params[:id]) #single hash
    render "edit.html.erb"
  end


  def update
    @product = Product.find_by(id: params[:id])

    product.update(
      name: params[:name], 
      price: params[:price], 
      description: params[:description], 
      image: params[:image]
      )
    flash[:success] = "Product updated!"
    redirect_to "/products/#{@product.id}"
  end


  def destroy
    @product = Product.find_by(id: params[:id])
    @product.destroy
    flash[:warning] = "Product Deleted!"
    redirect_to "/products"
  end

end


