class SessionsController < ApplicationController

  def new    
  end
 
  def create
    user = User.find_by_mail(params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:current_user_id] = user.uid
      flash[:success] = "Welcome"
      redirect_to root_path
    else
      flash[:error] = "Invalid email/password combination"
      render "new"
    end
  end
 
  def destroy
    redirect_to root_path
  end
end
