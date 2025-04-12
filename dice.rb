require "sinatra"
require "sinatra/reloader"
require "better_errors"
require "binding_of_caller"
# Need this configuration for better_errors
use(BetterErrors::Middleware)
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')


get "/" do
  <<-HTML
  <h1>Dice Roll</h1>
  <p>Select a dice option to roll:</p>
  <ul>
    <li><a href="/dice/2/6">Roll 2d6</a></li>
    <li><a href="/dice/2/10">Roll 2d10</a></li>
    <li><a href="/dice/1/10">Roll 1d10</a></li>
    <li><a href="/dice/5/4">Roll 5d4</a></li>
  </ul>
  HTML
end

get("/zebra") do
  "We must add a route for each path we want to support"
end

get("/giraffe") do
  "Hopefully this shows up without having to restart the server"
end

get("/dice/2/6") do
  first_die = rand(1..6)
  second_die = rand(1..6)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  <<-HTML
  <h1>2d6</h1>
  <p>#{outcome}</p>
  <p><a href="/">Back Home</a></p>
  HTML
end

get("/dice/2/10") do
  first_die = rand(1..10)
  second_die = rand(1..10)
  sum = first_die + second_die

  outcome = "You rolled a #{first_die} and a #{second_die} for a total of #{sum}."

  <<-HTML
  <h1>2d10</h1>
  <p>#{outcome}</p>
  <p><a href="/">Back Home</a></p>
  HTML
end

get("/dice/1/10") do
  first_die = rand(1..10)

  outcome = "You rolled a #{first_die}."

  <<-HTML
  <h1>1d10</h1>
  <p>#{outcome}</p>
  <p><a href="/">Back Home</a></p>
  HTML
end

get("/dice/5/4") do 
  d1 = rand(1..4)
  d2 = rand(1..4)
  d3 = rand(1..4)
  d4 = rand(1..4)
  d5 = rand(1..4)

  sum = d1 + d2 + d3 + d4 + d5

  outcome = "You rolled a #{d1}, a #{d2}, a #{d3}, a #{d4}, and a #{d5} for a total of #{sum}."

  <<-HTML
  <h1>5d4</h1>
  <p>#{outcome}</p>
  <p><a href="/">Back Home</a></p>
  HTML
end
