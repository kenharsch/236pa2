#loader classes for movie_data
#Ken Harsch
#kharsch@brandeis.edu
#passed unit test

require_relative "user.rb"
require_relative "movie.rb"
require_relative "rating.rb"

class Loader
    
    attr_accessor :movie_list, :user_list, :rating_list, :test_rating_list

    def load(path, sym)
        if sym == nil
            rating_list = []
            file = File.open(path + "/u.data", "r")
        else
            rating_list = []
            file = File.open(path + "/u1.base", "r")
        end
         file.each_line do |line|
                rating_list << line.split.map(&:to_i)
            end
        return rating_list  
    end

    def load_test_data
        test_rating_list = []
        file = File.open("ml-100k/u1.test", "r")
        file.each_line do |line|
            test_rating_list << line.split.map(&:to_i)
        end
        return test_rating_list         
    end


    def process_users(rating_list)
        user_list = {}
        rating_list.each do |row|
            u = row[0]
            m = row[1]
            r = row[2]
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
        rating_list.each do |row|
            u = row[0]
            m = row[1]
            r = row[2]
            if movie_list[m]
                movie_list[m][u] = r
            else
                movie_list[m] = {u => r}
            end
        end
        return movie_list
    end

end
