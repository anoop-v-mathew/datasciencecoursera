complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    ## generate filenames for data from specific monitors using the id vector
    filenames = paste(directory,
                      "/",
                      formatC(id,digits=0,width=3,flag="0",mode="integer"),
                      ".csv", 
                      sep="")
    
    
    i=1     # index
    x <- data.frame(id=id, nobs=0)  # initialize data frame
    
    ## read the data from the subset of files
    for(f in filenames) {
        temp <-read.csv(f, header=TRUE, dec=".")
        x$nobs[i] <- length(temp[complete.cases(temp), "ID"])
        i <- i+1
    }
    x
}