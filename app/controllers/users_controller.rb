class UsersController < ApplicationController
  skip_before_action :authenticate_user, only: [:create]

  def index
    @users = User.all
    render json: @users
  end



  def create
    @user = User.new(first_name: params[:first_name], last_name: params[:last_name], username: params[:username], password: params[:password], image: params[:image])

    if @user.save
      render json: @user
    else
      puts "blah"
    end
  end

end
