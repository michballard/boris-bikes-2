require_relative 'custom_error'
require_relative 'bike_container'

class Van

	include BikeContainer

	def initialize(options = {})
		self.capacity = options.fetch(:capacity, capacity)
		@bikes = []
	end

end

