class SessionsController < ApplicationController
  
  def create
    @user = User.find_by(username: params[:user][:username])
    if @user and BCrypt::Password.new(@user.password) == params[:user][:password]
      session = @user.sessions.create
      cookies.permanent.signed[:sea_sessions_token] = {
        value: session.token,
        httponly: true
      }
      render json: {
        logged_in: true,
        user: @user.as_json(only: [:username, :email]),
        
        
      }
    else
      render json: {message: "Invalid username or password"}, status: :unprocessable_entity
    end
  end
  
  def authenticated
    token = cookies.permanent.signed[:sea_sessions_token]
    #checking to see if session token valid from expiration
    session = Session.find_by(token: token)

    if session
      user = session.user
      render json: {
        username: user.username,
        isAuthenticated: true,
        
      }
    else
      render json: {
        isAuthenticated: false
      } 
    end
  end
  def destroy
    token = cookies.permanent.signed[:sea_sessions_token]
    session = Session.find_by(token: token)
    if session
      session.destroy
      render json: {
        logged_in: false
      }
    else
      render json: {message: "Not authenticated"}, status: :unauthorized
    end
  end

end
