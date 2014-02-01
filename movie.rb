#Movie class for movie_data
#Ken Harsch
#kharsch@brandeis.edu

class Movie
	attr_reader :movie_id, :viewers, :rating, :user_ratings

	def initialize (movie_id)
		@movie_id = movie_id
		@user_ratings = Hash.new
		@viewers = []
	end

	def add_user_rating(user_id, rating)
		@user_ratings[user_id: user_id, rating: rating]
		@viewers.push(user_id)
	end

	def viewers
		return viewers
	end

	def rating(user_id)
		return user_ratings.fetch(user_id)
	end

	def avg_rating
		i = 1
		rate = 1
		@user_ratings.each do |rating|
			i +=1
			rate += rating.rating
		end
		return rate/i
	end

end