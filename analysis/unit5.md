5.1
1) The three table join can be used as an activity log. The information it would display is the users who are rating the movies which movies and when.
So a report can be created and managers can see the activity of how movies are performing daily.

2) Junction table is needed because the two tables did not have any way of connecting them without creating a junction table. Without having a junction table we would have additional column of repeating generes which would make the data confusing.

5.2
1) Producer 15 and 14 were excluded. Left join had 15 producers and inner join had 13 producers.
2) When a producer has no events it means that they could have no ratings from users on there movies. Could be too new of a movie. 
3) An inner join would not give a complete picture as it could drop rows if there is mismatching rows on the join. 
4) Leadership may want to delete those accounts if they are able to see producers who were never active.
5) With these findings they can do an investigation on producer 14 and 15 and see why they have no events. 

5.3)
1) It could be useful if you wanted to see all the possible combination of for exampe movies to genres or users to movies.
2) The algorithm used is a nested loop and hash join
3) The information that made it useful is it explained what had an index and the conditions for the hash.
4) We are able to see how effective our query will be as the data set grows by seeing the selected join algorithms.
5) Changes to the data set size or the indexing on a table can change which algorithm is favored. If we are using a nested loop and there is an index we would use that. If memory allows a hash would work well for larger sets.

5.4)
In Task 5.3, you examined the execution plan for your three-table join. Reflect on the following question: What changes to your data or database schema might cause PostgreSQL to choose a different join algorithm?

Consider factors such as table size, indexes, and the number of matching records. Explain how these changes could influence query performance. Include your reflection in /analysis/unit5.md.

The changes to the data or schema that might cause PostgreSQL to choose a different algorithm would be if there were a larger data set or if a index is applied to a table. In my case a hash was used and nested loop and this was appropriate because we had a small list of users that can be used for this hash table and it would not cost much to run and as for the nested loop we had a index which made the choice of a nested loop appropriate. If there was no index or the dataset was too large that would cause me to want different choices to be made when it comes to the algorithm that postgres would be using. Table size, index, and matchings records heavily influence what we would be choosing when it comes to algorithms due to the cost. If we did not consider these factors then we would have a very slow query which could impact the rest of your system if you have multiple queries running or even cause locking. 