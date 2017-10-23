class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  private
	def require_login
		redirect_to login_path
	end
	
	def require_guest
		redirect_to login_path unless current_guest
	end
	
	def require_admin
	
	end
	
	def require_admin_or_guest
	end
end
