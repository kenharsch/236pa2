#movie database class to hold instances of movie, user for movie data
#Ken Harsch
#kharsch@brandeis.edu
require_relative "movie.rb"
require_relative "user.rb"
require_relative "movie_data.rb"
class MovieDb
	attr_reader :movie_list, :user_list, :movie, :user
	def initialize
		@movie_list = Hash.new{|movie_id, movie|}
		@user_list = Hash.new{|user_id, user|}
	end

	#takes movie_id returns movie object
	def movie (movie_id)
		return movie_list[movie_id]
	end

	#takes user_id returns user object
	def user (user_id)
		return user_list[user_id]
	end

	def add_user (user_id)
		u = User.new(user_id)
		@user_list[user_id: user_id, user: u]
	end

	def add_movie (movie_id)
		if movie_list.has_key?(movie_id) == false 
		m = Movie.new(movie_id)
		@movie_list[movie_id: movie_id, movie: m]
		end
	end
	
end


