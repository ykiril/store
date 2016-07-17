class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user, except: [:show]
  
  def show
    @history = OrderHistory.new(current_user)
  end
  
  def edit
  end

  def update
    if @user.update(user_params)
      flash[:notice] = t('account.flashes.account_updated')
      redirect_to edit_user_path
    else
      render :edit
    end
  end
  
  private
  
  def find_user
    @user = current_user    
  end

  def user_params
    params.require(:user).permit(
      :email, :password, :password_confirmation, :current_password,
      billing_address_attributes: address_attributes,
      shipping_address_attributes: address_attributes
    )
  end
  
  def address_attributes
    %i(id first_name last_name address zip city phone country_id)
  end
end

# class Users::SessionsController < Devise::SessionsController
#   def create
#     super do |resource|
#       BackgroundWorker.trigger(resource)
#     end
#   end
# end