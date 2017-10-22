class SessionsController < ApplicationController
	# don't require redirect to login because you're already at the login controller
    skip_before_action :require_login
	
	def new
	end
	
	def create
	end
	
	def destroy
		log_out
		redirect_to root_path
	end
end
