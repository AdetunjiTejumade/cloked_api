# AuthenticationController
class AuthenticationController < ApplicationController
  def authenticate
    token = AuthenticateUser.new(params[:email], params[:password]).call

    if token.present?
      render json: { auth_token: token }
    else
      render json: { error: 'invalid credentials' }, status: :unauthorized
    end
  end
end
