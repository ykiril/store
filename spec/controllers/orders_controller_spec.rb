require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:order) { build_stubbed(:order) }
  
  describe 'GET #show' do
    let(:user) { FactoryGirl.create(:user) }
    
    # sign_in_user
    
    # before do
    #   allow(controller).to receive(:current_user) { user }
    #   allow(user).to receive_message_chain(:orders, :find).and_return(order)
    #   get :show, params: { id: order.id }
    # end
    
    # it "assigns @order" do
    #   expect(assigns(:order)).not_to be_nil
    # end
  end
end
