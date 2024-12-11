source("02_01_input.R")

library(stringr)


issafe <- function(x) {
  result <- TRUE
  nelements <- length(x)
  for (i in 2:nelements) {
    result <- result && ((x[i] > x[i-1]) == (x[2] > x[1]))
    result <- result && (abs(x[i]-x[i-1]) >= 1)
    result <- result && (abs(x[i]-x[i-1]) <= 3)
  }
  return(result)
}

issafe_after_dumpener <- function(x){
  result <- TRUE
  nelements <- x %>% str_split(.," ", n = Inf, simplify = FALSE) %>% unlist() %>% strtoi() %>% length()
  num_report <- x %>% str_split(.," ", n = Inf, simplify = FALSE) %>% unlist() %>% strtoi()
  result <- result && issafe(num_report)
  if(issafe(num_report)) {
    return(result)
  } else {
    for (i in 1:nelements) result <- result || issafe(num_report[-i])
    return(result)
  }
}

reports <- str_split(reports_input, "\n", n = Inf, simplify = FALSE)
sep_reports <- unlist(reports)

logicalarray <- lapply(sep_reports, issafe_after_dumpener) %>% unlist()
safe_reports <- length(logicalarray[logicalarray==TRUE])