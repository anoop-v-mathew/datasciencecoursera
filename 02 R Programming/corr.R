source("complete.R")

corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    
    c <- complete(directory)
    t <- c[c$nobs > threshold,]
    cv <- vector("numeric", length(t$id))
    
    if (length(t$id) > 0) {
        filenames = paste(directory,
                          "/",
                          formatC(t$id,
                                  digits=0,
                                  width=3,
                                  flag="0",
                                  mode="integer"),
                          ".csv", 
                          sep="")
        i = 1

        for(f in filenames) {
            x <- read.csv(f, header=TRUE, dec=".")
            cv[i] <- cor(x[["nitrate"]],
                         x[["sulfate"]], 
                         use="pairwise.complete.obs")
            i <- i+1
        }
    }
    cv
}