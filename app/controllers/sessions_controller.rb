class SessionsController < ApplicationController
	# don't require redirect to login because you're already at the login controller
    skip_before_action :require_login
	
	def new
	end
	
	def create
		guest = Guest.find_by(email: params[:session][:email])
		
		if guest && guest.authenticate(params[:session][:password])
			log_in guest
			redirect_to root_path
		else
			flash.now[:danger] = "Invalid email/password combination."
			
			render 'new'
		end
	end
	
	def destroy
		log_out
		redirect_to root_path
	end
	
	private
		def session_params
			params.require(:session).permit(:email, :password)
		end
end
