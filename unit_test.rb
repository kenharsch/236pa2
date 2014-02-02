#unit test area
require_relative "user.rb"
require_relative "movie.rb"
require_relative "rating.rb"
class Loader
	attr_reader :ratings_list, :movies, :users

	def intitialize 
		@path = path
                @users = []
                @movies = []
	end

	def load
 		File.open("u.data", "r").each_line do |line|
        	temp = line.split
                puts temp[0].to_i
        	u = User.new(temp[0].to_i)
        	m = Movie.new(temp[1].to_i)
                u.add_movie(temp[1].to_i)
                m.add_user_rating(temp[0].to_i, temp[2].to_i)
               # @users.push(u)
               # @movies.push(m)
                end
                    
	end
end


lb = Loader.new
lt = Loader.new
lb.load


p lb.users
#p lt.movies[45]

