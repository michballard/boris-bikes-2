require 'csv'

class ReportCreation

	def create_report
		CSV.foreach("new_csv.csv") do |row|
    		puts row[1]
		end
	end

end
