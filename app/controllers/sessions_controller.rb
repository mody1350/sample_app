class SessionsController < ApplicationController
  def new
  end
  def create 
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && user.authenticate(params[:session][:password])
  		log_in user
  		flash[:success] = "Welcome #{current_user.name}"
  		redirect_to user
  		# render text: 'Successful LOGIN'
  	else
  		flash.now['danger'] = "Invalid email or password"
  		render :new
  	end
  end
  def destroy 
  	log_out
  	flash[:success] = 'Successfully logged out'
  	redirect_to root_path
  end
end
