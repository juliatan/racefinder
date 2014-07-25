require 'hotel_list'

task :populate_hotel_table => :environment do
	hotel_api_call_start_line
	hotel_api_call_finish_line
end