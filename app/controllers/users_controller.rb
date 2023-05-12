class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:create]
  def create
    @user = User.new(user_params)
    if @user and @user.save
      render json: {
        user: @user.as_json(only: [:username, :email])
      }, status: :created
    else
      render json: {message: "User not created"}, status: :unprocessable_entity
    end
  end
  def index
    @users = User.all
    render json: @users
  end
  

  private
  def user_params
    params.require(:user).permit(:username, :email, :password, :birthdate)
  end
end

