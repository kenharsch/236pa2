#movie data class
#Ken Harsch
#kharsch@brandeis.edu

class MovieData

	def initialize
		@users = {|user_id, user|}
		@movies = {|movie_id, movie|}
		@data = []
	end

	def load_base_data(path, sym)
		if sym = nil
			path = path + "/u.data"
		end
		if sym = ":u1"
			path = path + "/u1.base"
		end

		file = File.open(path)
		file.
	end

end

