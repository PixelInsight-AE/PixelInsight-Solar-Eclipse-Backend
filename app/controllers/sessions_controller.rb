class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def create
    @user = User.find_by(username: params[:user][:username])
    if @user and BCrypt::Password.new(@user.password) == params[:user][:password]
      session = @user.sessions.create
      cookies.permanent.signed[:sea_sessions_token] = {
        value: session.token,
        httponly: true
      }
      render json: {
        success: true,
      }
    else
      render json: {message: "Invalid username or password"}, status: :unauthorized
    end
  end
  
  def authenticated
    token = cookies.permanent.signed[:sea_sessions_token]
    session = Session.find_by(token: token)

    if session
      user = session.user
      render json: {
        authenticated: true,
      }
    else
      render json: {
        authenticated: false
      } 
    end
  end
  def destroy
    token = cookies.permanent.signed[:sea_sessions_token]
    session = Session.find_by(token: token)
    if session
      session.destroy
      render json: {
        success: true
      }
    else
      render json: {message: "Not authenticated"}, status: :unauthorized
    end
  end

end
