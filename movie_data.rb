#movie_data class 
#Ken Harsch
#kharsch@brandeis.edu
require_relative "movie.rb"
require_relative "user.rb"
require_relative "rating.rb"
require_relative "loader.rb"
require_relative "movie_test.rb"

class MovieData

	def initialize(path, sym)
        sym = nil
        @path = path
        @sym = sym	
        l = Loader.new
        @ratings = l.load(path, sym)
        @user_list = l.process_users(@ratings)
        @movie_list = l.process_movies(@ratings)
        @test_ratings = l.load_test_data
        @test_users = l.process_users(@test_ratings)
        @test_movies = l.process_movies(@test_ratings)
        @prediction = Hash.new
	end

    def rating (user_id, movie_id)
       return @user_list[user_id][movie_id]|| 0
    end

    def viewers(movie_id)
        viewers = []
        @movie_list[movie_id].each_pair do |user_id, rating|
            viewers<<user_id
        end
        return viewers
    end

    def movies(user_id)
        movies = []
        @user_list[user_id].each_pair do |movie_id, rating|
            movies<<movie_id
        end
        return movies
    end

    def avg_rating(movie_id)
        i = viewers(movie_id).length
        rate = 0
        @movie_list[movie_id].each_value{|value| rate = rate + value}
        return Float(rate)/i
    end

    def predict(user_id, movie_id)
        return avg_rating(movie_id)
    end

    def run_test
       @test_ratings.each do |row|
        row[3] = predict(row[0], row[1])
        end
        movie_test = MovieTest.new(@test_ratings)
        p movie_test.mean
        p movie_test.std_dev
        p movie_test.rms
    end
    
end



