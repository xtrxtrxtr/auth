# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::API
  def encode_token(payload)
    JWT.encode(payload, ENV.fetch('JWT_KEY'))
  end

  def decoded_token
    header = request.headers['Authorization']
    return if header.blank?

    token = header.split[1]
    begin
      JWT.decode(token, ENV.fetch('JWT_KEY'))
    rescue JWT::DecodeError
      nil
    end
  end

  def current_user
    return unless decoded_token

    user_id = decoded_token[0]['user_id']
    @current_user = User.find_by(uuid: user_id)
  end

  def authorized_only
    return unless current_user.nil?

    render json: { message: 'Please log in' }, status: :unauthorized
  end
end
