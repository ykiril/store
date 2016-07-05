class OrdersController < ApplicationController
  
  def show
    @order = Order.find(params[:id])
  end
  
  def edit
    @order = Order.in_progress.decorate
  end
  
  def add_book
    book = Book.find(params[:book_id])
    quantity = params[:order][:quantity].to_i
    order_in_progress.add_to_order(book, quantity)
    redirect_to cart_path
  end
  
  def update
  end
  
  def empty_cart
  end
  
  private
  
  def order_params
    params.require(:order).permit(:coupon_code, order_items_attributes: [:id, :quantity])
  end

end
