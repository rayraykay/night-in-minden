class GuestsController < ApplicationController
	before_action :require_guest, :except 	=> [:index]
	before_action :require_admin, :only 	=> [:index]

	# for admin side
	def index
	end

	def new
		redirect_to root_path if current_guest
	end
	
	def create
		strip_space_from_names
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
		strip_space_from_names
		permitted_params = guest_params
	
		# make changing password optional
		if params[:guest][:password].empty? && params[:guest][:password_confirmation].empty?
			permitted_params = params.require(:guest).permit(:first_name, :last_name, :email, :ticket, :restrictions)
			puts permitted_params
		end
		
		puts permitted_params
			
		if current_guest.update_attributes(permitted_params)
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
			params.require(:guest).permit(:first_name, :last_name, :email, :password, :password_confirmation, :ticket, :restrictions)
		end
		
		def strip_space_from_names
			params[:guest][:first_name] = params[:guest][:first_name].strip
			params[:guest][:last_name] = params[:guest][:last_name].strip
		end
end
