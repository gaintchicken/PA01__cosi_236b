class MovieData
	attr_accessor :listOfRatings
	def initialize
		@listOfRatings = Array.new
	end
	#loads data into an array, stores each rating as a Rating object
	def load_data
		File.open("u.data", "r").each_line do |line|
			a = line.split
			rating = Rating.new
			rating.user_id = a[0].to_i
			rating.movie_id = a[1].to_i
			rating.rating = a[2].to_i
			@listOfRatings.push(rating)
		end
	end
	#adds all the ratings of a movie together to determine how popular it is
	#this means a movie with 100 1 star reviews is higher than one with 10 5 star reviews
	def popularity(movie_id)
		total_pop = 0
		listOfRatings.each do |rating|
			if(rating.movie_id == movie_id)
				total_pop += rating.rating
			end
		end
		return total_pop
	end
end
class Rating
	attr_accessor :user_id, :movie_id, :rating
end
data = MovieData.new
data.load_data
puts data.listOfRatings[0].movie_id
print data.popularity(242)