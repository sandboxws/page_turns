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

  def add
    token = params[:token]
    if User.find_by_token(token)
      server = RPC::JSON::Client.new 'http://www.raboof.com/projects/jayrock/demo.ashx', 1.1
      begin
        response = server.add params[:a], params[:b]
        render json: {success: response}
      rescue Exception => e
        render json: {error: 'Problem communicating with server, please try again later.'}
      end
    else
      render json: {error: 'Invalid token'}
    end
  end
end
