class GuestsController < ApplicationController
	skip_before_action :require_login, :only => [:new, :create]

	# for admin side
	def index
	end

	def new
	end
	
	def create
		@new_guest = Guest.new(guest_params)
		
		puts params[:ticket]
		puts params[:email]
		
		if @new_guest.save
			flash[:success] = 'Welcome to a Night in Minden!'
			log_in @new_guest
			redirect_to '/'
		else
			flash.now[:danger] = 'There was something wrong with signup. Please try again.'
			render 'new'
		end
	end
	
	private
		def guest_params
			params.require(:guest).permit(:first_name, :last_name, :email, :password, :password_confirmation, :ticket)
		end
end
