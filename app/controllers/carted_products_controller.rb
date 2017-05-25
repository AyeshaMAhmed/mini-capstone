class CartedProductsController < ApplicationController 

  
#   def create

#         @product_id = params[:product_id]

#         product = Product.find_by(id: @product_id)

#         quantity = params[:quantity]
        
#         @order = Order.find_by(
#           user_id: current_user.id,
#           completed: false
#         )

#         if @order
         
#         else 
#         @order = Order.create(
#           user_id: current_user.id,
#           completed: false)
#         end

#           @newcart = CartedProduct.create(
#           quantity: params[:quantity],
#           product_id: params[:product_id],
#           order_id: @order.id
#           )

#       flash[:success] = "Added to your cart!"
#       redirect_to '/products'
#   end

# end
def index
  @order = Order.find_by(user_id: current_user.id, completed: false)
    if @order.carted_products.length > 0
    @carted_products = @order.carted_products
    render "index.html.erb"
    else
    flash[:warning] = "Your cart is empty"
    redirect_to '/products'
  end
end



def create
  order = Order.find_by(user_id: current_user.id, completed: false)
  if order 
    order_id = order.id
  else
    order = Order.create(user_id: current_user.id, completed: false)
    order_id = order.id
  end

    new_product = CartedProduct.create(
    product_id: params[:product_id],
    quantity: params[:quantity],
    order_id: order_id)

    flash[:succes] = "You added #{new_product.product.name} to you cart"
    redirect_to "/carted_products"
  end


  def destroy
    carted_product = CartedProduct.find_by(id: params[:id])
    carted_product.destroy
    redirect_to "/carted_products"

  end

end
