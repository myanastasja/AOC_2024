library(stringr)
library(plyr)

source("03_01_input.R")

good_instructions <- str_extract_all(input, "mul\\(\\d+,\\d+\\)") %>% unlist()

mul <- function(x) {
  mul_factors <- str_extract_all(x, "\\d+") %>% unlist() %>% strtoi
  mul_factors
  return(mul_factors[1] * mul_factors[2])
}

result <- lapply(good_instructions,mul) %>% unlist() %>% sum(.)

# 166357705