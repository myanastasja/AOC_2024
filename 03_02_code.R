source("03_01_input.R")




x <- "xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))"

str_extract_all(x, "don't\\(\\)")
enabled_muls <- str_extract_all(x, "(?=do\\(\\)?).*(?<=don't\\(\\)?)")
enabled_muls <- str_extract_all(x, ".*(?<=don't\\(\\)?)")

x <- c("1 piece", "2 pieces", "3 piece")
str_extract(x, "\\d+(?= pieces?)")

(?=...): positive look-ahead assertion. Matches if ... matches at the current input.

(?<=...): pos


good_instructions <- str_extract_all(enabled_muls, "mul\\(\\d+,\\d+\\)") %>% unlist()

mul <- function(x) {
  mul_factors <- str_extract_all(x, "\\d+") %>% unlist() %>% strtoi
  mul_factors
  return(mul_factors[1] * mul_factors[2])
}

result <- lapply(good_instructions,mul) %>% unlist() %>% sum(.)

# 166357705