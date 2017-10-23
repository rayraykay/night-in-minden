class AdminSessionsController < ApplicationController
	def new
	end
	
	def create
		admin = Admin.find_by(username: params[:admin_session][:username])
		
		if admin && admin.authenticate(params[:admin_session][:password])
			log_in_admin admin
			redirect_to root_path
		else
			flash.now[:danger] = "Invalid username/password combination."
			
			render 'new'
		end
	end
	
	def destroy
		log_out_admin
		redirect_to root_path
	end
	
	private
		def admin_session_params
			params.require(:admin_session).permit(:username, :password)
		end
end
