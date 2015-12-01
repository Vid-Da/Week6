class SessionsController < ApplicationController

	def new
		# if there is nothing it is the same than -- render :new
	end

	def create
		user = User.find_by_email(params[:email])
		
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			redirect_to '/profile'
		else
			redirect_to '/login'
		end
	end

	def destroy
		session.clear
		redirect_to '/'
	end

end
