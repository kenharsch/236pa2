#movie_test class for movie_data
#Ken Harsch
#kharsch@brandeis.edu
require_relative "loader.rb"
require_relative "movie_data.rb"


class MovieTest
	attr_reader :test_ratings, :mean, :std_dev, :rms

	def initialize(test_ratings)
		@data = test_ratings
		@mean = mean
		@std_dev = std_dev
		@rms = rms
        @i = test_ratings.length
    end

    def mean
    	i = @data.length
        m = 0
    	@data.each do |row|
    		m += (row[3] - row[2]).abs
    	end
    	return Float(m)/i
    end

    def std_dev
    	m = mean
        var = 0
    	i = @data.length
    	@data.each do |row|
    		var = (row[3] - mean).abs
    		var = var*var
    		var += var
    	end
    	var = Float(var)/i
    	return Math.sqrt(var)
    end

    #def rms
    #	k = 1 
    #	@data.each do |row|
    #		k += (row[2] - row[3])**2
    #	end
    #	return Math.sqrt(k/@i)
    #end

    def to_a
    	return @data
    end

end





   