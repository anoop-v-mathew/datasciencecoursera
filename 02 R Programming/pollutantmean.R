pollutantmean <- function(directory, pollutant, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'pollutant' is a character vector of length 1 indicating
    ## the name of the pollutant for which we will calculate the
    ## mean; either "sulfate" or "nitrate".
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return the mean of the pollutant across all monitors list
    ## in the 'id' vector (ignoring NA values)
    ## NOTE: Do not round the result!
    
    ## generate filenames for data from specific monitors using the id vector
    filenames = paste(directory,
                      "/",
                      formatC(id,digits=0,width=3,flag="0",mode="integer"),
                      ".csv", 
                      sep="")
    
    ## read the specific pollutant data from the file subset
    ## looping through the id integer vector
    x <- numeric()
    for(f in filenames) {
        x <- c(x, read.csv(f, header=TRUE, dec=".")[[pollutant]])
    }
    
    ## calculate mean
    mean(x[!is.na(x)])
}