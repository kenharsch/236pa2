#test file for movie_data pa1
#Ken Harsch
#kharsch@brandeis.edu

require_relative "movie_data.rb"
require_relative "movie.rb"
require_relative "user.rb"
require_relative "movie_db.rb"

m = MovieData.new("ml-100k", nil)
m.load_data
puts m.rating(196, 242)
puts m.viewers(242)

