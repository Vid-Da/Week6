class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user

	# Memoization
  def current_user
  	@current_user ||= User.find_by_id(session[:user_id])
  	
  	#same than
  		#@current_user = @current_user || User.find_by_id(session[:user_id])
  end 

  def authorize_user
  	if !current_user
  		flash[:message] = "Signup please!"
  		redirect_to	:login
  	end
  end

end
