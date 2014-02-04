#test file for movie_data pa1
#Ken Harsch
#kharsch@brandeis.edu

require_relative "movie_data.rb"
require_relative "movie.rb"
require_relative "user.rb"
require_relative "loader.rb"
require_relative "movie_test.rb"

m = MovieData.new("ml-100k", ":u1")
puts "User 196 rates movie 242: "
m.rating(196, 242)
puts "Viewers of movie 242: "
p m.viewers(242)
puts "Movies viewed by 196: "
p m.movies(196)
puts "Average rating of movie 242:"
p m.avg_rating(242)
a = Time.now
puts "Predicted rating of movie 242 by user 196: "
p m.predict(196, 242)
b = Time.now
puts "The time for 1 prediction is: "
puts b - a

test = m.run_test(100)
mt = MovieTest.new(test)
puts "Mean difference = "
p mt.mean
puts "Standard deviation = "
p mt.std_dev
puts "Root mean square = "
p mt.rms


