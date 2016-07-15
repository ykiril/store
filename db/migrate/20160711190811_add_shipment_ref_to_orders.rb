class AddShipmentRefToOrders < ActiveRecord::Migration
  def change
    add_reference :orders, :shipment, index: true, foreign_key: true
  end
end
