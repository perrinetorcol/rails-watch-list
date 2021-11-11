require 'json'
require 'open-uri'

url = 'https://api.themoviedb.org/3/movie/top_rated?api_key=9e9560886d098532d4aeade83ab91ad4&language=en-US&page=1'
parsed_movies = URI.open(url).read
movies_results = JSON.parse(parsed_movies)
movies = movies_results['results']

movies.each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: "https://image.tmdb.org/t/p/w500/#{movie['poster_path']}",
    rating: movie['vote_average']
  )
end

puts "DB seeded DUDETTE 🌱"
