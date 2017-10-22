class TablesController < ApplicationController
	skip_before_action :require_login

	def selection
		@tables = Table.all
	end
	
	def select_table
		table = Table.find_by(id: params[:table])
		
		if table.guests.count < table.max_capacity
			current_guest.update_attribute(:table_id, table.id)
			flash[:success] = 'You are now at Table ' + table.id.to_s + '!'
		else
			flash[:danger] = 'That table has just exceeded maximum capacity. Please select another one.'
		end
		
		redirect_to table_selection_path
	end
end
