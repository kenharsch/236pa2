#test file for movie_data pa1
#Ken Harsch
#kharsch@brandeis.edu

require_relative "movie_data.rb"
require_relative "movie.rb"
require_relative "user.rb"
require_relative "loader.rb"
require_relative "movie_test.rb"

m = MovieData.new("ml-100k", ":u1")
m.rating(196, 242)
p m.viewers(242)
p m.movies(196)
p m.avg_rating(242)

test = m.run_test(100)
mt = MovieTest.new(test)
p mt.mean
p mt.std_dev
p mt.rms


