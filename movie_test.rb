#movie_test class for movie_data
#Ken Harsch
#kharsch@brandeis.edu
require_relative "loader.rb"
require_relative "movie_data.rb"


class MovieTest
	attr_reader :test_ratings, :mean, :std_dev, :rms

	def initialize(test_ratings)
		@data = test_ratings
		@mean = get_mean
		@std_dev = get_std_dev
		@rms = get_rms
    end

    def get_mean
        m = 0
        i = 0
    	@data.each do |row|
    		m += (row[3].to_f - row[2].to_f).abs
            i += 1
        end
    	return Float(m)/i
    end

    def get_std_dev
    	m = @mean
        var = 0
    	i = @data.length
    	@data.each do |row|
    		var = (row[3] - mean).abs
    		var = var*var
    		var += var
    	end
        if i == nil
            return 0
        end
    	var = Float(var)/i
    	return Math.sqrt(var)
    end

    def get_rms
    	k = 0 
        i = @data.length
        m = get_mean
    	@data.each do |row|
    		k += (m - (row[2] - row[3]))**2
    	end
        if i == nil
            return 0
        end
    	return Math.sqrt(k/i)
    end

    def mean
        return get_mean
    end

    def std_dev
        return get_std_dev
    end

    def rms
        return get_rms
    end

    def to_a
    	return @data
    end

end





   