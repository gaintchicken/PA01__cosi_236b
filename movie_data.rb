class MovieData
	attr_accessor :list_of_ratings, :popularity_list
	def initialize
		@list_of_ratings = Array.new
		@popularity_list = Array.new
	end
	#loads data into an array, stores each rating as a Rating object
	def load_data
		File.open("u.data", "r").each_line do |line|
			a = line.split
			rating = Rating.new(a[0].to_i, a[1].to_i, a[2].to_i)
			@list_of_ratings.push(rating)
		end
	end
	#adds all the ratings of a movie together to determine how popular it is
	#this means a movie with 100 1 star reviews is higher than one with 10 5 star reviews
	def popularity(movie_id)
		total_pop = 0
		list_of_ratings.each do |rating|
			if(rating.movie_id == movie_id)
				total_pop += rating.rating
			end
		end
		return total_pop
	end
	#fills @popularity_list with most popular movies
	def popularity_list
		temp_hash = {}
		@list_of_ratings.each do |rating|
			temp_hash[rating.movie_id] = rating.rating
		end
		
	end
end
class Rating
	attr_accessor :user_id, :movie_id, :rating
	def initialize(user_id, movie_id, rating)
		@user_id = user_id
		@movie_id = movie_id
		@rating = rating
	end
end
data = MovieData.new
data.load_data
puts data.list_of_ratings[1].movie_id
puts data.popularity(242)
data.popularity_list
