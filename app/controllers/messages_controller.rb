# frozen_string_literal: true

class MessagesController < ApplicationController
  before_action :authenticate_request, only: :index

  def create
    user = User.find_by(name: params[:username])
    if user.present?
      user&.anon_messages&.create(message_params)
      render json: @message, status: :created
    else
      render json: { error: 'User does not exist' }, status: :unprocessable_entity
    end
  end

  def index
    @user_messages = @current_user.anon_messages
    render json: @user_messages
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.new(request.headers).call
    render json: { error: 'Not Authorized' }, status: :unauthorized unless @current_user
  end

  def message_params
    params.require(:message).permit(:content, :username)
  end
end
