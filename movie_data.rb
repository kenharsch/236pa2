#movie_data class 
#Ken Harsch
#kharsch@brandeis.edu
require_relative "movie.rb"
require_relative "user.rb"
require_relative "rating.rb"
require_relative "loader.rb"

class MovieData

	def initialize(path, sym)
        sym = nil
        @path = path
        @sym = sym	
        l = Loader.new
        @ratings = l.load(path, sym)
        @user_list = l.process_users(@ratings)
        @movie_list = l.process_movies(@ratings)
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

    def avg_rating(movie_id)
        i = viewers(movie_id).length
        rate = 0
        @movie_list[movie_id].each_value{|value| rate = rate + value}
        return Float(rate)/i
    end


    def predict(user_id, movie_id)
        predicted_rating = db_base.movie(movie_id).avg_rating
        return prediction[user_id: user_id, prediction: predicted_rating]
    end


    def run_test
        
    end
    
end



