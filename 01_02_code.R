install.packages("plyr")
library(plyr)

similarity_score <- 0

for (i in 1:length(list_one)) {
  similarity_score <- similarity_score + length(list_two[list_two==list_one[i]])*list_one[i]
}

