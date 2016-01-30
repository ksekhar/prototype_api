class UsersController < ApplicationController

  def create
    user = User.new(user_params)

    if user.valid? && user.save
      render json: {success: true} and return
    else
      render json: {success: false, errors: user.errors.values} and return
    end
  end

  def login
    user = User.where(email: params[:email], password: params[:password]).first
    user = User.where(username: params[:email], password: params[:password]).first if user.blank?
    if user.present?
      cookies.signed[:user_id] = user.auth
      render json: {success: true} and return
    else
      render json: {success: false} and return
    end
  end

  private

  def user_params
    params.permit(:id, :username, :first_name, :last_name, :email, :password, :password_confirmation)
  end
end
