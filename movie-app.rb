require "http"
puts "Welcome to the movie app! Please type in a number to return a movie. Type \"q\" to quit."
while true
  x = gets.chomp
  if x == "q"
    puts "Thank you for using this app!"
    break
  elsif x.to_i == 1
    response = HTTP.get("http://127.0.0.1:3000/first_movie")
    pp response.parse
  elsif x.to_i == 2
    response = HTTP.get("http://127.0.0.1:3000/second_movie")
    pp response.parse
  end
end