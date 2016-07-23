class AddressForm
  include ActiveModel::Model
  attr_accessor  :billing_address_attributes,
                 :shipping_address_attributes
                 
  validate :create_errors                 
  
  def billing_address
    user.billing_address ||= user.try(:billing_address) || Address.new
  end

  def shipping_address
    user.shipping_address ||= user.try(:shipping_address) || Address.new
  end
  
  def save
    bind_address
    return false unless valid?
    shipping_address.save && billing_address.save
    user.save
  end
  
  private
  
  def bind_address
    shipping_address.assign_attributes(shipping_address_attributes)
    billing_address.assign_attributes(billing_address_attributes)
  end
  
  def create_errors
    add_errors(billing_address.errors) if billing_address.invalid?
    add_errors(shipping_address.errors) if shipping_address.invalid?
  end
  
  def add_errors(errors_items)
    errors_items.each do |attribute, message|
      errors.add(attribute, message)
    end
  end
  
  
end