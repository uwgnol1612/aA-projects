def what_was_that_one_with(those_actors)
  # Find the movies starring all `those_actors` (an array of actor names).
  # Show each movie's title and id.
  Movie
    .select(:title, :id)
    .joins(castings: :actor)
    .where('actors.name IN (?)', those_actors)
    .group(:id)
    .having('COUNT(actors.id) >= ?', those_actors.length)

end

def golden_age
  # Find the decade with the highest average movie score.
  
  Movie 
    .select('AVG(score), (yr / 10) * 10 AS decade')
    .group('decade')
    .order('AVG(score) DESC')
    .first 
    .decade

end

def costars(name)
  # List the names of the actors that the named actor has ever
  # appeared with.
  # Hint: use a subquery

  all_movies = Movie.select(:id).joins(castings: :actor).where(actors: {name: name})
  
  Actor
    .distinct
    .joins(castings: :movie)
    .where(movies: {id: all_movies})
    .where.not(actors: {name: name})
    .pluck(:name) 
end


def actor_out_of_work
  # Find the number of actors in the database who have not appeared in a movie
  Actor
    .select(:name)
    .left_outer_joins(:castings)
    .where(castings: {actor_id: nil})
    .count
  
end

def starring(whazzername)
  # Find the movies with an actor who had a name like `whazzername`.
  # A name is like whazzername if the actor's name contains all of the
  # letters in whazzername, ignoring case, in order.

  # ex. "Sylvester Stallone" is like "sylvester" and "lester stone" but
  # not like "stallone sylvester" or "zylvester ztallone"

  matcher = "%#{whazzername.split("").join('%')}%"
  Movie.joins(:actors).where('UPPER(actors.name) LIKE UPPER(?)', matcher)

end

def longest_career
  # Find the 3 actors who had the longest careers
  # (the greatest time between first and last movie).
  # Order by actor names. Show each actor's id, name, and the length of
  # their career.
  
  Actor
    .select(:name, :id, 'MAX(movies.yr) - MIN(movies.yr) AS career')
    .joins(:movies)
    .order('career DESC, name')
    .group(:id)
    .limit(3)

end
