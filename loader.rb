#loader classes for movie_data
#Ken Harsch
#kharsch@brandeis.edu

class Loader
	attr_reader 

	def intitialize 
		@path = path
		@ratings_list = []

	def load(path)
 		File.open(base).each_line do |line|
        	temp = line.split
            u = User.new(temp[0].to_i)
            m = Movie.new(temp[1].to_i)
            r = Rating.new(u, m, temp[2].to_i, temp[3].to_i)
            u.add_movie(m)
            m.add_user_rating(u, temp[2].to_i)
			ratings_list.push(r)
        end      
	end

		


