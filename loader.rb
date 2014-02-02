#loader classes for movie_data
#Ken Harsch
#kharsch@brandeis.edu

class Loader
	attr_reader :ratings_list, :movies, :users

	def intitialize 
		@path = path
		@ratings_list = 
		@users = []
		@movies = []

	def load(path)
 		File.open(base).each_line do |line|
        	temp = line.split
        	if users.include?(temp[0].to_i) == false
        		users<<


            u = User.new(temp[0].to_i)
            m = Movie.new(temp[1].to_i)
            r = Rating.new(u, m, temp[2].to_i, temp[3].to_i)
            u.add_movie(m)
            m.add_user_rating(u, temp[2].to_i)
			ratings_list.push(r)
			users.push(u)
			movies.push(m)
        end      
	end
end

l = Loader.new(ml-100k/u.data)


		


