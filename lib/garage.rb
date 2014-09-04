require_relative 'boris_bikes'
require_relative 'bike_container'

class Garage

	include BikeContainer

	attr_reader :garage_number

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
		@bikes        = options.fetch(:bikes, [])
		@garage_number = generate_garage_number

	end

	def fix_all_broken_bikes
		broken_bikes.each(&:fix!)
	end

	def generate_garage_number
		"#{[*"A".."Z"].sample(2).join}-#{rand(10..99)}"		
	end
end