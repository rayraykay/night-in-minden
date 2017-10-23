module SessionsHelper
	def log_in (guest)
		cookies.signed[:guest_id] = guest.id
	end
	
	def current_guest? (guest)
		guest == current_guest
	end
	
	def current_guest
		@current_guest ||= Guest.find_by(id: cookies.signed[:guest_id])
	end
	
	def logged_in?
		!current_guest.nil?
	end
	
	def log_out
		cookies.signed[:guest_id] = nil
		@current_guest = nil
	end
	
	def log_in_admin (admin)
		cookies.signed[:admin_id] = admin.id
	end
	
	def log_out_admin
		cookies.signed[:admin_id] = nil
		@current_admin = nil
	end
	
	def current_admin
		@current_admin ||= Admin.find_by(id: cookies.signed[:admin_id])
	end
	
	def logged_in_admin?
		!current_admin.nil?
	end
end
