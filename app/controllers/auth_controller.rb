class AuthController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def create
    @user = User.find_by(username: params[:username])

    if @user&.authenticate(params[:password])

      @token = encode_token({user_id: @user.id})
      render json: { user: UserSerializer.new(@user), jwt: @token }, status: :accepted
    else
      render json: { message: "Invalid username or password" }, status: :unauthorized
    end
  end

  # def show
  #   # Moved below, commented out, logic to ApplicationController
  #
  #   # token = request.headers['Authenticate']
  #   # decoded = JWT.decode(token, 'secret', true, { algorithm: 'HS256' }).first
  #   # id = decoded["id"]
  #   # user = User.find_by(id: id)
  #
  #   #--> user became current_user method call from ApplicationController
  #   if current_user
  #     render json: { id: current_user.id, username: current_user.username }
  #   else
  #     render json: { error: 'fucked up' }, status: 401
  #   end
  # end
end
