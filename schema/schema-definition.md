Relationship Schema:

tblUsers - 
    - userId : PK, int, not null
    - displayName: varchar (150), not null

tblMovies -
    - movieId: PK, int, not null
    - displayName: varchar (250), not null
    - activityFlag: boolean, not null
    - movieLengthMinute: int, must be positive, not null

tblRatings -
    - userId: FK from tblUsers, not null
    - movieId: FK from tblMovies, not null
    - timeStamp: datetime, not null
    - score: decimal, must be a positive value, not null

tblGenres -

    genreId: PK, int, not null
    genreType: varchar(150), no duplicates, not null

tblMovieGenres -
    - movieId: FK tblMovies, not null
    - genreId: FK tblGenres, not null
