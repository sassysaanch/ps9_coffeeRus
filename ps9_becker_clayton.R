################################################################################
##
## [ PROJ ] < Problem set 9 >
## [ FILE ] < ps9_becker_clayton >
## [ AUTH ] < cnbecker14 >
## [ INIT ] < Saturday March 11, 2013 >
##
################################################################################

## ---------------------------
## libraries
## ---------------------------

library(tidyverse)

## ---------------------------
## directory paths
## ---------------------------

## -----------------------------------------------------------------------------
## Part 2 - Label each question using comments
## -----------------------------------------------------------------------------

# Question 1 

string_with_quotes <- '"Honey!?" \n"What?" \n"Wheres\'s my Super Suit?" \n"I..uhh..put it away" \n"Where??" \n"Why do you need to know??" \n"I need it!" \n"Nuh uh! Don\'t you even think about going off and doing no dare and do! We\'ve been planning this dinner for two months!" \n"The public is is danger!!" \n"My EVENING\'S in danger!" \n"You tell me where my suit is woman! We are talking about the greater good!" \n"Greater good?? I am your wife. I\'m the greatest GOOD you are EVER gonna get!"'

print(string_with_quotes)
writeLines(string_with_quotes)

# Question 2 

string_with_spchars <- 'I could\'ve thought up another movie quote to go here. \nBut after the last one...\tI really feel as though my work is done here.'

print(string_with_spchars)
writeLines(string_with_spchars)

# Question 3

string_with_backslashes <- "c\\l\\a\\y\\t\\o\\n"

print(name_string)
writeLines(name_string)

# Question 4

# The print function prints the underlying text, i.e. how the object is actually stored in R complete with
# all of the backslashes and special characters. By contrast, writeLines prints what that output corresponds
# to when the meaning of all the special characters is interpreted. In other words, the writeLines function
# prints the text how it is meant to be read by the end user.


## -----------------------------------------------------------------------------
## Part 3 - Label each question using comments
## -----------------------------------------------------------------------------

# Question 1

str_view_all(string_with_quotes, pattern = "'", html = FALSE)

# Question 2 

str_view_all(string_with_quotes, pattern = '"', html = FALSE)

# Question 3

str_view_all(string_with_spchars, pattern = "\t", html = FALSE)

# Question 4 

str_view_all(string_with_spchars, pattern = "\n", html = FALSE)

# Question 5 

str_view_all(string_with_backslashes, pattern = "\\\\", html = FALSE)


## -----------------------------------------------------------------------------
## Part 4 - Label each question using comments
## -----------------------------------------------------------------------------

# Question 1

text <- c("In 5... 4... 3... 2...",
          "It can cost anywhere between $50 to $100 (... or even $1k!)",
          "These are parenthesis (), while these are brackets []... I think.")

# Question 2

str_view(text, pattern = "^I")

# Question 3

str_view(text, pattern = "\\.$")

# Question 4

str_view_all(text, pattern = "\\d+")

# Question 5 (need to do)

5. Show all matches to all dollar amounts, including the dollar sign and `k` if there is one (i.e., `$50`, `$100`, `$1k`)

str_view_all(text, pattern = "[$]\\d+|[$\\d+]k")

# Question 6

str_view_all(text, pattern = "\\...")

# Question 7 (need to do)

7. Show all matches to parentheses, including the contents between the parentheses if there are any.

str_view_all(text, pattern = "\\(\\)")

# Question 8

str_view_all(text, pattern = "[a-zA-Z]\\w+|I")

# Question 9

str_view_all(text, pattern = "[a-zA-Z]\\w{4,}|\\...")

# Question 10

str_view_all(text, pattern = "([a-zA-Z0-9])\\1")

## -----------------------------------------------------------------------------
## END SCRIPT
## -----------------------------------------------------------------------------
