#User class for movie_data
#Ken Harsch
#kharsch@brandeis.edu
#passed unit test

class User
	attr_accessor :user_id, :movies
	def initialize (user_id)
		@user_id = user_id
		@movies = []
	end

	def add_movie (movie_id)
		@movies.push(movie_id)
	end

	def movies_seen
		return movies
	end

	def id
		return user_id
	end

end