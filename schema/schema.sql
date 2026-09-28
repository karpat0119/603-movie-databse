DROP TABLE IF EXISTS "tblMovieGenres" CASCADE;
DROP TABLE IF EXISTS "tblRatings"     CASCADE;
DROP TABLE IF EXISTS "tblGenres"      CASCADE;
DROP TABLE IF EXISTS "tblMovies"      CASCADE;
DROP TABLE IF EXISTS "tblUsers"       CASCADE;

-- 1. tblUsers — this is the first table to be created as it will be used as FK in another table later
CREATE TABLE "tblUsers" (
    "userId"      INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "displayName" VARCHAR(150) NOT NULL
);

-- 2. tblMovies — this is the second table to be created as it will be used as FK in another table later
CREATE TABLE "tblMovies" (
    "movieId"           INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "displayName"       VARCHAR(250) NOT NULL,
    "activityFlag"      BOOLEAN      NOT NULL,
    "movieLengthMinute" INTEGER      NOT NULL,
    CONSTRAINT chk_movies_duration_positive
        CHECK ("movieLengthMinute" > 0)
);

-- 3. tblGenres — — this is the third table to be created as it will be used as FK in another table later
CREATE TABLE "tblGenres" (
    "genreId"   INTEGER GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    "genreType" VARCHAR(150) NOT NULL,
    CONSTRAINT uq_genres_type UNIQUE ("genreType")
);

-- 4. tblRatings — PK is the pair of foreign keys, so this was done fourth because the userId and movieId as FK.
CREATE TABLE "tblRatings" (
    "userId"    INTEGER      NOT NULL,
    "movieId"   INTEGER      NOT NULL,
    "timeStamp" TIMESTAMP    NOT NULL,
    "score"     NUMERIC(3,2) NOT NULL,
    CONSTRAINT pk_ratings PRIMARY KEY ("userId", "movieId"),
    CONSTRAINT fk_ratings_user
        FOREIGN KEY ("userId") REFERENCES "tblUsers" ("userId")
        ON DELETE CASCADE,
    CONSTRAINT fk_ratings_movie
        FOREIGN KEY ("movieId") REFERENCES "tblMovies" ("movieId")
        ON DELETE CASCADE,
    CONSTRAINT chk_ratings_score_positive
        CHECK ("score" > 0)
);

-- 5. tblMovieGenres — PK is the pair of foreign keys, so this was done last because the userId, genreId, and movieId as FK.
CREATE TABLE "tblMovieGenres" (
    "movieId" INTEGER NOT NULL,
    "genreId" INTEGER NOT NULL,
    CONSTRAINT pk_movie_genres PRIMARY KEY ("movieId", "genreId"),
    CONSTRAINT fk_movie_genres_movie
        FOREIGN KEY ("movieId") REFERENCES "tblMovies" ("movieId")
        ON DELETE CASCADE,
    CONSTRAINT fk_movie_genres
        FOREIGN KEY ("genreId") REFERENCES "tblGenres" ("genreId")
        ON DELETE RESTRICT
);
