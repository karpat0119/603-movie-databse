Constraints:

tblUsers - 
    - userId : Not null
    - displayName: Not null

tblMovies -
    - movieId: Not null
    - displayName: Not null
    - activityFlag: Not null
    - movieLengthMinute: Not null, Check

tblRatings -
    - userId: Not null, On delete cascade is needed here, because if a userID is removed from the primary table it will cause this record to be an orhpan.
    - movieId: Not null, On delete restrict because if it were cascade it would delete every rating associated with that movie.
    - timeStamp: Not null
    - score: Not null, Check

tblGenres -

    genreId: Not null
    genreType: Not null, unique

tblMovieGenres -
    - movieId: Not null, on delete cascade because if a movie is deleted from the primary table then in this junction table it would need to be removed.
    - genreId: Not null, on delete restrict because multiple movies uses the same generes.
