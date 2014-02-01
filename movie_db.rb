#movie database class to hold instances of movie, user for movie data
#Ken Harsch
#kharsch@brandeis.edu
require_relative "movie.rb"
require_relative "user.rb"
require_relative "movie_data.rb"
class MovieDb
	attr_reader :movie_list, :user_list, :movie, :user
	def initialize
		@movie_list = Hash.new
		@user_list = Hash.new
	end

	#takes movie_id returns movie object
	def movie (movie_id)
		return @movie_list[movie_id]
	end

	#takes user_id returns user object
	def user (user_id)
		return @user_list[user_id]
	end

	def add_user (user_id)
		u = User.new(user_id)
		@user_list[user_id: user_id]
	end

	def add_movie (movie_id)
		m = Movie.new(movie_id)
		@movie_list[movie_id: movie_id]
	end

	def add_rating(user_id, movie_id, rating, timestamp)
		r = rating.new(user_id, movie_id, rating, timestamp)
		@rating_list[user_id: user_id, movie_id: movie_id, rating: rating, timestamp: timestamp]
	end

	
end


