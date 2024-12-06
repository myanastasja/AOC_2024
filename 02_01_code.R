source("02_01_input.R")

library(stringr)

issafe <- function(x) {
  result <- TRUE
  nelements <- x %>% str_split(.," ", n = Inf, simplify = FALSE) %>% unlist() %>% strtoi() %>% length()
  num_report <- x %>% str_split(.," ", n = Inf, simplify = FALSE) %>% unlist() %>% strtoi()
  for (i in 2:nelements) {
    result <- result && ((num_report[i] > num_report[i-1]) == (num_report[2] > num_report[1]))
    result <- result && (abs(num_report[i]-num_report[i-1]) >= 1)
    result <- result && (abs(num_report[i]-num_report[i-1]) <= 3)
  }
  return(result)
}

reports <- str_split(reports_input, "\n", n = Inf, simplify = FALSE)
sep_reports <- unlist(reports)

logicalarray <- sapply(sep_reports, issafe) %>% unlist()

logicalarray <- lapply(sep_reports, issafe) %>% unlist()
safe_reports <- length(logicalarray[logicalarray==TRUE])

