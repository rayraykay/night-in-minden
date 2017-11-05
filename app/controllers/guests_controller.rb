class GuestsController < ApplicationController
	before_action :require_admin_or_guest, 	:except => [:index, :new, :create]
	before_action :require_admin, 			:only 	=> [:index]

	# for admin side
	def index
		@guests = Guest.all.sort_by do |g|
				if g.table_id.nil?
					-1
				else
					g.table_id
				end
			end
		
	end

	def new
	end
	
	def create
		strip_space_from_names
		@new_guest = Guest.new(guest_params)
		
		if @new_guest.save
			if logged_in_admin?
				flash.now[:success] = 'Welcome to a Night in Minden!'
				log_in @new_guest
			else
				flash.now[:success] = 'You have added guest ' + @new_guest.first_name + ' ' + @new_guest.last_name
			end
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
		if logged_in_admin?
			@guest = Guest.find_by(id: params[:id])
		elsif logged_in?
			redirect_to login_path if params[:id].to_i != current_guest.id
			@guest = current_guest
		else
			redirect_to login_path
		end
	end
	
	def update
		strip_space_from_names
		permitted_params = guest_params
		
		# safe because edit
		if logged_in_admin?
			@guest = Guest.find_by(id: params[:id])
		else
			@guest = current_guest
		end
	
		# make changing password optional
		if params[:guest][:password].empty? && params[:guest][:password_confirmation].empty?
			permitted_params = params.require(:guest).permit(:first_name, :last_name, :email, :ticket, :restrictions)
			puts permitted_params
		end
		
		puts permitted_params
		puts @guest.first_name
			
		if @guest.update_attributes(permitted_params)
			flash.now[:success] = 'You have changed your information.'
			render 'edit'
		else
			flash.now[:danger] = []
			for error in @guest.errors.full_messages
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
