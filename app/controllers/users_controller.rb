class UsersController < ApplicationController
  
end

class Users::SessionsController < Devise::SessionsController
  def create
    super do |resource|
      BackgroundWorker.trigger(resource)
    end
  end
end