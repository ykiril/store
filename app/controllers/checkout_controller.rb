class CheckoutController < ApplicationController
  include Wicked::Wizard
  
  before_action :check_order
  steps :address, :delivery, :payment, :confirm, :complete
  
  def show
    @checkout_form = CheckoutForm.new(checkout_form_params)
    @order = order_in_progress.decorate
    render_wizard
  end
  
  def update
    @checkout_form = CheckoutForm.new(checkout_form_params)
    render_wizard(@checkout_form)
  end
  
  
  private
  
  def check_order
    redirect_to cart_path if order_in_progress.empty?
  end
  
  def address_attributes
    %i(id first_name last_name address zip city phone country_id)
  end
  
  def checkout_form_params
    params.fetch(:checkout_form, {})
          .permit(        
            :use_billing,
            billing_address_attributes: address_attributes,
            shipping_address_attributes: address_attributes,
            credit_card_attributes: [:number, :exp_month, :exp_year, :cvv])
          .merge(
            order: order_in_progress,
            step: step)  
  end
end

