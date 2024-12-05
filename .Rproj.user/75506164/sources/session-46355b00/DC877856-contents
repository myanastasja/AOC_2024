source("01_input.R")

mytext <- str_split(mytext, "\n", n = Inf, simplify = FALSE)
# typeof(mytext)
# length(mytext[[1]])

list_one <- c()
list_two <- c()

for (i in 1:length(mytext[[1]])) {
  list_one[i] <- substr(mytext[[1]][i], 1, 5)
  list_two[i] <- substr(mytext[[1]][i], 8, 13)
}

list_one <- list_one %>% sort() %>% strtoi()
list_two <- list_two %>% sort() %>% strtoi()
result <- sum(abs(list_one - list_two))
result  
