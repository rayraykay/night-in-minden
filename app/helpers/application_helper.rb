module ApplicationHelper
	NUM_OF_TICKETS = 300
	PROFESSOR_TABLES = [3, 4, 5]

	def ticket_count
		return NUM_OF_TICKETS
	end
	
	def is_prof_table?(table_id)
		return PROFESSOR_TABLES.include?(table_id)
	end
end
