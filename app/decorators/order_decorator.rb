class OrderDecorator < Draper::Decorator
  delegate_all
  
  def order_empty?
    Order.where(state: 'in_progress').count < 1
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
