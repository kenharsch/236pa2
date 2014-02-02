#Rating class for movie_data
#Ken Harsch
#kharsch@brandeis.edu
#passed unit test

class Rating
	attr_reader :user_id, :movie_id, :rate, :timestamp
	def initialize (user_id, movie_id, rate, timestamp)
		@user_id = user_id
		@movie_id = movie_id
		@rate = rate
		@timestamp = timestamp
	end
end