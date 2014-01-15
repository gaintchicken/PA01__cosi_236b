class MovieData
	attr_accessor :listOfRatings
	def initialize
		@listOfRatings = Array.new
	end
	def load_data
		File.open("u.data", "r").each_line do |line|
			a = line.split
			rating = Rating.new
			rating.user_id = a[0]
			rating.movie_id = a[1]
			rating.rating = a[2]
			@listOfRatings.push(rating)
		end
	end
end
class Rating
	attr_accessor :user_id, :movie_id, :rating
end
data = MovieData.new
data.load_data
print data.listOfRatings[0].user_id