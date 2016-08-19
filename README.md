# Election-Data

I have a project I've been working on that requires me to put election results into a database.  I've done a little bit of searching and to my surprise I was unable to find data in a format that is easily importable - or at least in the way that I wanted to import it.  So, I had to create it.  Hopefully you will find this data to be useful for your own projects.

## Using the data

In the Data subdirectory, you will find text files containing pipe-delimited election results.  Each year gets its own file.  Please feel free to use these files as you see fit.  If you would like, go ahead and look in the Model subdirectory.  You will find a number of SQL files that can be used to create and populate a database.  I am using a local instance of PostgreSQL; if you plan to use something else you will need to modify these files (or create your own).  There are also two shell scripts that can be used to create the whole thing as well as destroy it when you are done.

## Security

Database security is important, but this project does not address security at all.  Your database installation will be different than mine and your security needs will be different than mine.  These scripts assume that you have a local database that accepts unauthenticated connections and that the user that you use to run the commands has the necessary permissions.  This works for me at the present time but as I develop and refine my project this may change.
