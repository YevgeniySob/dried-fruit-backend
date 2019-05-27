class UsersController < ApplicationController
  skip_before_action :authorized, only: [:create]

  def index
    @users = User.all
    render json: @users
  end

  def profile
    puts "profile" * 100
    render json: { user: UserSerializer.new(current_user) }, status: :accepted
  end


  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], password: params[:password], image: params[:image])

    if @user.save
      @token = issue_token(user_id: @user.id)
      # render json: @user
      render json: {user: UserSerializer.new(@user), jwt: @token}, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end
  end

end
