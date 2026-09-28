# 603-movie-databse

This database theme is movies and it will hold user, movies, genres and rating data. 

The platform that will be built based on this database will be a web application that will allow users to rate movies. This system must be able to handle the following questions. What is the highest rated movie? What is the highest rated movie by time frame? What movies are trending? These questions will all be answered with one analytic view for the user. On this page it will allow users to apply filters that the backend application would then pass to SQL. The filters will be time related, and a filter between if it is trending or the sorted by rank.

The other questions that users will want to know is what movies should I watch. The way we will answer this is by providing the users a list of movies that are similar in genre. Or if they want to know a list of movies that are less than 120 minutes this can also be provided. With the filters that the user has, the user will be able to create a view that fits their needs. 

![Database Schema ERD](schema/erd.png)

## Schema

We have tblUsers, tblMovies, tblGenres, tblRatings and tblMovieGenres in this database. tblUsers, tblMovies, and tblGenres each have their own primary key ints. As for tblRatings and tblMoviegenres we are using foreign keys in this table that act as our primary keys. Now for tblRatings when deleting a userId (FK) we have it on cascade so it will also delete from this table as I did not want orphan records. And in the same table movieId we are using cascade as well because we would want to delete the ratings for that movie if it no longer will exist in our database. Now for tblMovieGenres we have a delete cascade on our movieId because if a movie is delete we do not need the genre of the movie recorded in that table. For genreId I decided to do a restrict on the delete because if a genere is deleted it would cause all the other movies associated to that genre to be deleted if it was cascaded.