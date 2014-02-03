#loader classes for movie_data
#Ken Harsch
#kharsch@brandeis.edu
#passed unit test

require_relative "user.rb"
require_relative "movie.rb"
require_relative "rating.rb"

class Loader
    
    attr_accessor :movie_list, :user_list, :rating_list

    def load(path, sym)
        if sym == nil
            rating_list = []
            file = File.open(path + "/u.data", "r")
            file.each_line do |line|
                rating_list << line.split.map(&:to_i)
            end
        else
            rating_list = []
            file = File.open(path + "/u1.base", "r")
            file.each_line do |line|
                rating_list << line.split.map(&:to_i)
            end
            test_rating_list = []
            file_t = File.open(path + "/u1.test", "r")
            file_t.each_line do |line|
            test_rating_list << line.split.map(&:to_i)
            end
        end
        return rating_list  
    end

    def load_test_data
        test_rating_list = []
        
    end


    def process_users(rating_list)
        user_list = {}
        rating_list.each do |entry|
            u = entry[0]
            m = entry[1]
            r = entry[2]
            if user_list[u]
                user_list[u][m] = r 
            else
                user_list[u] = {m => r}
                end    
        end
        return user_list
    end

    def process_movies(rating_list)
        movie_list = {}
        rating_list.each do |entry|
            u = entry[0]
            m = entry[1]
            r = entry[2]
            if movie_list[m]
                movie_list[m][u] = r
            else
                movie_list[m] = {u => r}
            end
        end
        return movie_list
    end
end
