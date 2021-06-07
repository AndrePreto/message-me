class SessionsController < ApplicationController
  
  # GET /login (sessions#new)
  def new; end

  # POST /login (sessions#create)
  def create
    user = User.find_by(username: params[:session][:username])
    if user.present? && user.authenticate(params[:session][:password])
      flash[:success] = 'Logged in successfully' 
      session[:current_user_id] = user.id
      redirect_to root_path
    else
      flash.now[:error] = 'Incorrect Username or Password'
      render 'new'
    end
  end

  # DELETE /logout (sessions#destroy)
  def destroy
    session[:current_user_id] = nil
    flash[:success] = 'Logged out successfully' 
    redirect_to root_path
  end
  
end