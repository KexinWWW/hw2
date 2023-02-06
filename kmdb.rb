# In this assignment, you'll be using the domain model from hw1 (found in the hw1-solution.sql file)
# to create the database structure for "KMDB" (the Kellogg Movie Database).
# The end product will be a report that prints the movies and the top-billed
# cast for each movie in the database.

# To run this file, run the following command at your terminal prompt:
# `rails runner kmdb.rb`

# Requirements/assumptions
#
# - There will only be three movies in the database – the three films
#   that make up Christopher Nolan's Batman trilogy.
# - Movie data includes the movie title, year released, MPAA rating,
#   and studio.
# - There are many studios, and each studio produces many movies, but
#   a movie belongs to a single studio.
# - An actor can be in multiple movies.
# - Everything you need to do in this assignment is marked with TODO!

# Rubric
# 
# There are three deliverables for this assignment, all delivered within
# this repository and submitted via GitHub and Canvas:
# - Generate the models and migration files to match the domain model from hw1.
#   Table and columns should match the domain model. Execute the migration
#   files to create the tables in the database. (5 points)
# - Insert the "Batman" sample data using ruby code. Do not use hard-coded ids.
#   Delete any existing data beforehand so that each run of this script does not
#   create duplicate data. (5 points)
# - Query the data and loop through the results to display output similar to the
#   sample "report" below. (10 points)

# Submission
# 
# - "Use this template" to create a brand-new "hw2" repository in your
#   personal GitHub account, e.g. https://github.com/<USERNAME>/hw2
# - Do the assignment, committing and syncing often
# - When done, commit and sync a final time before submitting the GitHub
#   URL for the finished "hw2" repository as the "Website URL" for the 
#   Homework 2 assignment in Canvas

# Successful sample output is as shown:

# Movies
# ======

# Batman Begins          2005           PG-13  Warner Bros.
# The Dark Knight        2008           PG-13  Warner Bros.
# The Dark Knight Rises  2012           PG-13  Warner Bros.

# Top Cast
# ========

# Batman Begins          Christian Bale        Bruce Wayne
# Batman Begins          Michael Caine         Alfred
# Batman Begins          Liam Neeson           Ra's Al Ghul
# Batman Begins          Katie Holmes          Rachel Dawes
# Batman Begins          Gary Oldman           Commissioner Gordon
# The Dark Knight        Christian Bale        Bruce Wayne
# The Dark Knight        Heath Ledger          Joker
# The Dark Knight        Aaron Eckhart         Harvey Dent
# The Dark Knight        Michael Caine         Alfred
# The Dark Knight        Maggie Gyllenhaal     Rachel Dawes
# The Dark Knight Rises  Christian Bale        Bruce Wayne
# The Dark Knight Rises  Gary Oldman           Commissioner Gordon
# The Dark Knight Rises  Tom Hardy             Bane
# The Dark Knight Rises  Joseph Gordon-Levitt  John Blake
# The Dark Knight Rises  Anne Hathaway         Selina Kyle

# Delete existing data, so you'll start fresh each time this script is run.
# Use `Model.destroy_all` code.
# TODO!
Studio.destroy_all
Movie.destroy_all
Actor.destroy_all
Role.destroy_all

# Generate models and tables, according to the domain model.
# TODO!

# Insert data into the database that reflects the sample data shown above.
# Do not use hard-coded foreign key IDs.
# TODO!

studio = Studio.new
studio["name"] = "Warner Bros."
studio.save

warner_bros = Studio.find_by({"name" => "Warner Bros."})

movie = Movie.new
movie["title"] = "Batman Begins"
movie["year_released"] = 2005
movie["rated"] = "PG-13"
movie["studio_id"] = warner_bros["id"]
movie.save

movie_1 = Movie.new
movie_1["title"] = "The Dark Knight"
movie_1["year_released"] = 2008
movie_1["rated"] = "PG-13"
movie_1["studio_id"] = warner_bros["id"]
movie_1.save

movie_2 = Movie.new
movie_2["title"] = "The Dark Knight Rises"
movie_2["year_released"] = 2012
movie_2["rated"] = "PG-13"
movie_2["studio_id"] = warner_bros["id"]
movie_2.save

actor = Actor.new
actor["name"] = "Christian Bale"
actor.save

actor_1 = Actor.new
actor_1["name"] = "Michael Caine"
actor_1.save

actor_2 = Actor.new
actor_2["name"] = "Liam Neeson"
actor_2.save

actor_3 = Actor.new
actor_3["name"] = "Katie Holmes"
actor_3.save

actor_4 = Actor.new
actor_4["name"] = "Gary Oldman"
actor_4.save

actor_5 = Actor.new
actor_5["name"] = "Heath Ledger"
actor_5.save

actor_6 = Actor.new
actor_6["name"] = "Aaron Eckhart"
actor_6.save

actor_7 = Actor.new
actor_7["name"] = "Maggie Gyllenhaal"
actor_7.save

actor_8 = Actor.new
actor_8["name"] = "Tom Hardy"
actor_8.save

actor_9 = Actor.new
actor_9["name"] = "Joseph Gordon-Levitt"
actor_9.save

actor_10 = Actor.new
actor_10["name"] = "Anne Hathaway"
actor_10.save

christian_bale = Actor.find_by({"name" => "Christian Bale"})
michael_caine = Actor.find_by({"name" => "Michael Caine"})
liam_neeson = Actor.find_by({"name" => "Liam Neeson"})
katie_holmes = Actor.find_by({"name" => "Katie Holmes"})
gary_oldman = Actor.find_by({"name" => "Gary Oldman"})
heath_ledger = Actor.find_by({"name" => "Heath Ledger"})
aaron_eckhart = Actor.find_by({"name" => "Aaron Eckhart"})
maggie_gyllenhaal = Actor.find_by({"name" => "Maggie Gyllenhaal"})
tom_hardy = Actor.find_by({"name" => "Tom Hardy"})
joseph_gordon_levitt = Actor.find_by({"name" => "Joseph Gordon-Levitt"})
anne_hathaway = Actor.find_by({"name" => "Anne Hathaway"})

batman_begins = Movie.find_by({"title" => "Batman Begins"})
the_dark_knight = Movie.find_by({"title" => "The Dark Knight"})
the_dark_knight_rises = Movie.find_by({"title" => "The Dark Knight Rises"})

role = Role.new
role["movie_id"] = batman_begins["id"]
role["actor_id"] = christian_bale["id"]
role["character_name"] = "Bruce Wayne"
role.save

role_1 = Role.new
role_1["movie_id"] = batman_begins["id"]
role_1["actor_id"] = michael_caine["id"]
role_1["character_name"] = "Alfred"
role_1.save

role_2 = Role.new
role_2["movie_id"] = batman_begins["id"]
role_2["actor_id"] = liam_neeson["id"]
role_2["character_name"] = "Ra's Al Ghul"
role_2.save

role_3 = Role.new
role_3["movie_id"] = batman_begins["id"]
role_3["actor_id"] = katie_holmes["id"]
role_3["character_name"] = "Rachel Dawes"
role_3.save

role_4 = Role.new
role_4["movie_id"] = batman_begins["id"]
role_4["actor_id"] = gary_oldman["id"]
role_4["character_name"] = "Commissioner Gordon"
role_4.save

role_5 = Role.new
role_5["movie_id"] = the_dark_knight["id"]
role_5["actor_id"] = christian_bale["id"]
role_5["character_name"] = "Bruce Wayne"
role_5.save

role_6 = Role.new
role_6["movie_id"] = the_dark_knight["id"]
role_6["actor_id"] = heath_ledger["id"]
role_6["character_name"] = "Joker"
role_6.save

role_7 = Role.new
role_7["movie_id"] = the_dark_knight["id"]
role_7["actor_id"] = aaron_eckhart["id"]
role_7["character_name"] = "Harvey Dent"
role_7.save

role_8 = Role.new
role_8["movie_id"] = the_dark_knight["id"]
role_8["actor_id"] = michael_caine["id"]
role_8["character_name"] = "Alfred"
role_8.save

role_9 = Role.new
role_9["movie_id"] = the_dark_knight["id"]
role_9["actor_id"] = maggie_gyllenhaal["id"]
role_9["character_name"] = "Rachel Dawes"
role_9.save

role_10 = Role.new
role_10["movie_id"] = the_dark_knight_rises["id"]
role_10["actor_id"] = christian_bale["id"]
role_10["character_name"] = "Bruce Wayne"
role_10.save

role_11 = Role.new
role_11["movie_id"] = the_dark_knight_rises["id"]
role_11["actor_id"] = gary_oldman["id"]
role_11["character_name"] = "Commissioner Gordon"
role_11.save

role_12 = Role.new
role_12["movie_id"] = the_dark_knight_rises["id"]
role_12["actor_id"] = tom_hardy["id"]
role_12["character_name"] = "Bane"
role_12.save

role_13 = Role.new
role_13["movie_id"] = the_dark_knight_rises["id"]
role_13["actor_id"] = joseph_gordon_levitt["id"]
role_13["character_name"] = "John Blake"
role_13.save

role_14 = Role.new
role_14["movie_id"] = the_dark_knight_rises["id"]
role_14["actor_id"] = anne_hathaway["id"]
role_14["character_name"] = "Selina Kyle"
role_14.save


# Prints a header for the movies output
puts "Movies"
puts "======"
puts ""

# Query the movies data and loop through the results to display the movies output.
# TODO!
batman_movies = Movie.where({"studio_id" => warner_bros["id"]})

for movie in batman_movies
    movie_name = movie["title"]
    movie_year_released = movie["year_released"]
    movie_rated = movie["rated"]
    movie_studio = Studio.find_by({"id" => movie["studio_id"]})

    puts "#{movie_name} #{movie_year_released} #{movie_rated} #{movie_studio["name"]}"
end

# Prints a header for the cast output
puts ""
puts "Top Cast"
puts "========"
puts ""

# Query the cast data and loop through the results to display the cast output for each movie.
# TODO!

batman_roles = Role.all

for role in batman_roles
    movie_name = Movie.find_by({"id" => role["movie_id"]})
    role_actor = Actor.find_by({"id" => role["actor_id"]})
    role_name = role["character_name"]

    puts "#{movie_name["title"]} #{role_actor["name"]} #{role_name}"
end