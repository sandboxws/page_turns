class HomeController < ApplicationController
  def index
    @users = User.all
  end

  def login
    user = User.find_by_email(params[:email])
    if user && user.valid_password?(params[:password])
      render json: {token: user.token}
    else
      render json: {error: 'Invalid credentials'}
    end
  end
end
