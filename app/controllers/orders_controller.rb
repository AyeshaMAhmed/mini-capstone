class OrdersController < ApplicationController

  def create
        @product_id = params[:product_id]
        @order = Order.create(
        quantity: params[:quantity],
        user_id: current_user.id,
        subtotal: params[:price] * params[:quantity],
        product_id: @product_id)

      flash[:success] = "Product added!"
      render 'show'
  end

  def show
    @order = Order.find_by(id: params[:id])
  end

  def update
    order = Order.find_by(id: params[:id])
    order.completed = true
    
    calculated_subtotal = 0

    order.carted_products.each do |carted_product|
      calculated_subtotal += carted_product.product.price * carted_product.quantity 
  end

    calculated_tax = calculated_subtotal * 0.09
    
    order.subtotal = calculated_subtotal
    order.tax = calculated_subtotal * 0.09
    order.total = calculated_subtotal + calculated_tax
    order.save
  
    redirect_to '/orders/#{order.id}'
  end
end