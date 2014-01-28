#movie_data class 
#Ken Harsch
#kharsch@brandeis.edu
require_relative "movie.rb"
require_relative "user.rb"
require_relative "rating.rb"
require_relative "movie_db.rb"

class MovieData

attr_reader :db_base, :db_test, :prediction

	def initialize(path, sym)
        @path = path
        @sym = sym	
        @raw = []
        @prediction = Hash.new{|user_id, predicted_rating|}
	end

	def load_data
        sym = nil
        if sym == :u1
            base = @path + "/u1.base"
            test = @path + "/u1.test"
            load_base(base)
            load_test(test)
        elsif sym == nil
            base = @path + "/u.data"
            load_base(base)
        end
    end

    def load_base (base)
        db_base = MovieDb.new
        File.open(base).each_line do |line|
        	temp = line.split
            u = temp[0].to_i
            m = temp[1].to_i
            r = temp[2].to_i
            t = temp[3].to_i
            @raw.push(u, m, r, t)
            db_base.add_user(u)
            db_base.add_movie(m)
        end
    end

def load_test (test)
        db_test = MovieDb.new
        File.open(test).each_line do |line|
            temp = line.split
            u = temp[0].to_i
            m = temp[1].to_i
            r = temp[2].to_i
            t = temp[3].to_i
            @raw.push(u, m, r, t)
            db_base.add_user(u)
            db_base.add_movie(m)
        end
    end

    def process_raw
        @raw.each do |entry|
            db_base.user(entry[0]).add_movie(entry[1])
            db_base.movie(entry[1]).add_user_rating(entry[0], entry[2])
        end
    end

    def rating (user_id, movie_id)
       return db_base.movie(movie_id).rating(user_id) || 0
       
    end

    def predict(user_id, movie_id)
        predicted_rating = db_base.movie(movie_id).avg_rating
        return prediction[user_id: user_id, prediction: predicted_rating]
    end

    def viewers(movie_id)
        return db_base.movie(movie_id).viewers
    end

    def run_test
        @db_base.user_list.each do|user|
            @db_base.movie_list.each do|movie|
                p = predict(user_id, movie_id)
                @prediction[user_id: user_id, prediction: p]
            end
        end

    end


    def calc_popularity
        #Popularity is calculated as the sum of the number of times watched
        #and the total ratings awarded. 
        rating_list.each do |rating|
            if @popularity_list[rating[1]]
                @popularity_list[rating[1]] += rating[2]
            else
                 @popularity_list[rating[1]] = rating[2]
            end
        end
        @popularity_list = @popularity_list.sort_by{|movie_id, rating| rating}.reverse
    end

    def popularity (movie_id)
       return @popularity_list[movie_id]
    end

    def popularity_list
        return @popularity_list
    end

    def top_ten
        puts "The top ten movies with ratings are: "
            for i in 0 ..9
            puts popularity_list[i]
        end
    end
    
    def bottom_ten
        puts "The bottom ten movies with ratings are: "
        j = popularity_list.length
        for i in 0 ..9
            puts popularity_list[j - i]
        end
    end

    def similarity (user1, user2)
        sim = 0
        @rating_list.each do |rating|
           if rating[0] == user1
            movtemp = rating[1]
            ratetemp = rating[2]
            @rating_list.each do |rating|
                if rating[0] == user2 and rating[1] == movtemp
                    sim = 5 - (ratetemp - rating[3]).abs
                end
            end
        end
        return sim
    end

    def most_similar (user1)
        best = 0
        most_sim = nil
        @user_list.each do |user|
            s = similarity(user1, user[0])
            if s > best
                best = s
                most_sim = user[0]
            end
        end
        puts "The user who is most similar to #{user1} is: "
        puts most_sim
    end

end

    end


