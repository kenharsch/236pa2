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
        @sym = sym
        @path = path
        @sym = sym	
        l = Loader.new
        @ratings = l.load(path, sym)
        @user_list = l.process_users(@ratings)
        @movie_list = l.process_movies(@ratings)
	end

    def rating (user_id, movie_id)
       return @user_list[user_id][movie_id]|| 0
    end

    def viewers(movie_id)
        viewers = []
        if @movie_list[movie_id]
            @movie_list[movie_id].each_pair do |user_id, rating|
            viewers<<user_id
            end
        end
        return viewers
    end

    def movies(user_id)
        movies = []
        if @user_list[user_id]
            @user_list[user_id].each_pair do |movie_id, rating|
                movies<<movie_id
            end
        end
        return movies
    end

    def avg_rating(movie_id)
        rate = 0
        i = 0
        @movie_list[movie_id].each_pair do |user_id, rating|
            rate += rating
            i += 1
        end
        return Float(rate)/i
    end

    def predict(user_id, movie_id)
        user_avg_rate = 0
        j = 0
        temp = 0
        @user_list[user_id].each_pair do |movie_id, rating|
            j += 1
            temp += rating
        end
        user_avg_rate = Float(temp)/j
        return user_avg_rate
=begin
        if user_avg_rate > 4
            return 3 + 1
        elsif user_avg_rate < 2
            return 3 - 1
        else 
            return 3
        end
=end
    end

    def run_test(k)
      l = Loader.new
      test_list = l.load_test_data
      test_list = test_list.first(k)
      test_m_list = l.process_movies(test_list)
      test_u_list = l.process_users(test_list)
      test_list.each do |row|
        row[3] = predict(row[0], row[1])
        end
    return test_list
    end
    
end



