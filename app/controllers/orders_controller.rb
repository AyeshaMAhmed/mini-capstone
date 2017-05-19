class OrdersController < ApplicationController

  def create
      Order.create(
        quantity: params[:quantity],
        user_id: current_user.id)
      
      flash[:success] = "Product added!"
      redirect_to "/orders/:id"
  end
end
