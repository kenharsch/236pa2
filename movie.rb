#Movie class for movie_data
#Ken Harsch
#kharsch@brandeis.edu
#passed unit test

class Movie
	attr_reader :movie_id, :viewers, :rating, :user_ratings

	def initialize (movie_id)
		@movie_id = movie_id
		@user_ratings = Hash.new
		@viewers = []
	end

	def add_user_rating(user_id, rating)
		@user_ratings[user_id] = rating
		@viewers.push(user_id)
	end

	def viewers
		return @viewers
	end

	def rating(user_id)
		return @user_ratings[user_id]
	end

	def avg_rating
		i = user_ratings.length
		rate = 0
		@user_ratings.each_value{|value| rate = rate + value}
		return Float(rate)/i
	end
end
