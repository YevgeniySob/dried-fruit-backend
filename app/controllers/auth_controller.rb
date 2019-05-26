class AuthController < ApplicationController
  def create
    user = User.find_by(username: params[:username])

    if user&.authenticate(params[:password])
      puts 'lol' * 200
      render json: { id: user.id, username: user.username }
    else
      puts 'hhhhh' * 200
      render json: { error: "fucked up" }, status: 401
    end
  end

  def show
    token = request.headers['Authenticate']
    user = User.find_by(id: token)

    if user
      render json: { id: user.id, username: user.username }
    else
      render json: { error: 'fucked up' }, status: 401
    end
  end
end
