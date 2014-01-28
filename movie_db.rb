#movie database class to hold instances of movie, user for movie data
#Ken Harsch
#kharsch@brandeis.edu

class MovieDb
	def initialize
		@movie_list = Hash.new{|movie_id, movie|}
		@user_list = Hash.new{|user_id, user|}
	end

	#takes movie_id returns movie object
	def movie (movie_id)
		return movie_list.fetch(movie_id)
	end

	#takes user_id returns user object
	def user (user_id)
		return user_list.fetch(user_id)
	end
end


