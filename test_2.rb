#test file for movie_data pa1
#Ken Harsch
#kharsch@brandeis.edu

require_relative "movie_data.rb"
require_relative "movie.rb"
require_relative "user.rb"
require_relative "loader.rb"

m = MovieData.new("ml-100k", nil)
m.rating(196, 242)
p m.viewers(242)
p m.avg_rating(242)


