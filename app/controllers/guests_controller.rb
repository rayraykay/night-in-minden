class GuestsController < ApplicationController
	skip_before_action :require_login, :only => [:new, :create, :edit, :update]

	# for admin side
	def index
	end

	def new
		redirect_to root_path if current_guest
	end
	
	def create
		@new_guest = Guest.new(guest_params)
		
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
		redirect_to login_path if params[:id].to_i != current_guest.id
	end
	
	def update
		if current_guest.update_attributes(guest_params)
			flash[:success] = 'You have changed your information.'
			render 'edit'
		else
			flash.now[:danger] = []
			for error in current_guest.errors.full_messages
				flash.now[:danger].push(error)
			end
			
			render 'edit'
		end
	end
	
	private
		def guest_params
			params.require(:guest).permit(:first_name, :last_name, :email, :password, :password_confirmation, :ticket)
		end
end
