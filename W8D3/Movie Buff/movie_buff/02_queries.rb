def eighties_b_movies
  # List all the movies from 1980-1989 with scores falling between
  # 3 and 5 (inclusive).
  # Show the id, title, year, and score.
  Movie
    .select(:id, :title, :yr, :score)
    .where(yr: (1980..1989))
    .where(score: (3..5))
  # Movie
  #   .select(:id, :title, :yr, :score)
  #   .where(yr: (1980..1989), score: (3..5))
    # .where(':yr BETWEEN 1980 AND 1989', ':score BETWEEN 3 AND 5')
end

def bad_years
  # List the years in which a movie with a rating above 8 was not released.
  Movie.group(:yr).having('MAX(score) < 8').pluck(:yr)

end

def cast_list(title)
  # List all the actors for a particular movie, given the title.
  # Sort the results by starring order (ord). Show the actor id and name.
  Actor
    .select(:id, :name)
    .joins(castings: :movie)
    .where('movies.title = ?', title)
    .order('castings.ord')
end

def vanity_projects
  # List the title of all movies in which the director also appeared
  # as the starring actor.
  # Show the movie id and title and director's name.

  # Note: Directors appear in the 'actors' table.
  Movie
    .distinct.select(:id, 'actors.name',:title)
    .joins(castings: [{actor: :directed_movies}])
    .where('movies.director_id = castings.actor_id')
    .where('castings.ord = 1')
end

def most_supportive
  # Find the two actors with the largest number of non-starring roles.
  # Show each actor's id, name and number of supporting roles.
  Casting
    .select('actors.id', 'actors.name', 'COUNT(movie_id) AS roles')
    .joins(:actor)
    .where('castings.ord != 1')
    .group('actors.id', 'actors.name')
    .order('roles DESC')
    .limit(2)
  
end
