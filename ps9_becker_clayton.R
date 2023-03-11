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
## END SCRIPT
## -----------------------------------------------------------------------------
