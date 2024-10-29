# frozen_string_literal: true

# Users controller
class UsersController < ApplicationController
  def create
    handler = Users::RegistrationHandler.new(nil)
    render json: { result: handler.register(user_parameters) }
  end

  private

  def user_parameters
    params.require(:user).permit(Users::RegistrationHandler.permitted_parameters)
  end
end
