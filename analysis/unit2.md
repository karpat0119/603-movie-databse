For tblRatings foreign key is userId and we are using cascade as a rating should not exist without a user.
For tblRatings foreign key is movieId and we are using cascade as a rating should not exist without a movie.

In tblRatinngs we are using the userId as a foreign key as movieId as a foreign key because we want each record to be able to be linked to a user and a movie that they were rating. The reason that each is cascade is because if a user or movie gets deleted we do not need a record that is not linked to a movie or a user. That record becomes useless. So when a producer is removed the record from this table will also be removed. If we did not remove it then we would be stuck with orphan records.



For tblMovieGenres foreign key is movieId and we are using cascade since this is a junction table once the movie is gone there should not be a entry.
For tblMovieGenres foreign key is genreId and we are using restrict since multiple movies share genres if we were to delete the genre it would delete the other movies.

In tblMoviegenres our foreign keys are movieId, and genreId. For these we are using a cascade on movieId and restrict on genreId. The reason is if a movie is deleted we have no reason to have that record in this table. It would not link back to any movie in the other table. And if we did not delete the record when the movie is deleted then we would be left with an orphan record. Now for the genreId the reason that we did not have this on cascade is because multiple movies are linked to one genre. If we were to cascade it then we would lose a bunch of movies as well in the records. 


chk_movies_duration_positive makes sure that the movie that is being inserted is greater than 0. The reason that we want this is because we do not want movie lengths that are 0 minutes or less. Now if we did not have this constraint then we could have negative values and 0 in that value.

chk_ratings_score_positive makes sure that we have a value greater than 0. The reason is we want a rating that is useful and not one that is 0 or negative. So this will help ensure we do not get any values that we do not need. If we did not have this constraint it is possible we could have values that are 0 or negative.
