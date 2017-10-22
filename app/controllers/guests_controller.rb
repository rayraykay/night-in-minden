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
			redirect_to root_path
		else
			flash.now[:danger] = []
			for error in @new_guest.errors.full_messages
				flash.now[:danger].push(error)
			end
			
			render 'new'
		end
	end
	
	def edit
		redirect_to root_path if params[:id] != current_guest.id
	end
	
	def update
	end
	
	private
		def guest_params
			params.require(:guest).permit(:first_name, :last_name, :email, :password, :password_confirmation, :ticket)
		end
end
