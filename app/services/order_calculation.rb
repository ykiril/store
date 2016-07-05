class OrderCalculation
  def initialize(order)
    @order = order
  end
  
  delegate :order_books, :shipment, :coupon, to: :order
  
  def books_total
    order_books.inject(0) { |sum, book| (book.price * book.quantity) + sum }
  end
  
  def shipment_total
    shipment ? shipment.price : 0
  end
  
  def discount
    coupon ? coupon.discount : 0
  end
  
  def total
    books_total + shipment_total - discount
  end
  
  private

  attr_reader :order
  
end