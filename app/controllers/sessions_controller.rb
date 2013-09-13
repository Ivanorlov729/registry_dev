class SessionsController < ApplicationController
  
  AUTHENTICATE_URL = 'http://198.57.244.119/luxesocialevents/authorize.php'
  TEST_AUTHENTICATE_URL = 'http://192.168.0.78/workspace/drupal/authorize.php'
  
  def new    
  end
 
  def create
    user = User.find_by_mail(params[:session][:email].downcase)
    
    option = user.pass
    pswd = params[:session][:password]

    params = {'pswd'=>pswd, 'option'=>option[0,12]}
    x = Net::HTTP.post_form(URI.parse(AUTHENTICATE_URL), params)
    pswd_token = x.body

    if user && pswd_token == option
      session[:current_user_id] = user.uid
      flash[:success] = "Welcome"
      redirect_to root_path
    else
      flash[:error] = "Invalid email/password combination"
      render "new"
    end
  end
 
  def destroy
    session[:current_user_id] = nil
    flash[:success] = "Sign out"
    redirect_to root_path
  end
end
