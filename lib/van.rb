require_relative 'custom_error'
require_relative 'bike_container'

class Van

	include BikeContainer

	attr_reader :van_number

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
		@bikes = []
		@van_number = generate_van_number
	end

	def collect_broken_bikes_from(station)
		until station.broken_bikes.empty?
			accept(station.release_a_bike)
		end
	end

	def release_broken_bikes_to(garage)
		until self.broken_bikes.empty?
			garage.accept(release_a_bike)
		end
	end

	def collect_available_bikes_from(garage)
		until garage.available_bikes.empty?
			accept(garage.release_a_bike)
		end
	end

	def release_fixed_bikes_to(station)
		until self.available_bikes.empty?
			station.accept(release_a_bike)
		end
	end

	def generate_van_number
		"#{[*"A".."Z"].sample(3).join}-#{rand(100..999)}"
	end
end

