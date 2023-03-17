################################################################################
##
## [ PROJ ] < Problem set #5 >
## [ FILE ] < Homework Edu 260B >
## [ AUTH ] < Saanchi Shah/ sassysaanch >
## [ INIT ] < 2/12/2023 >
##
################################################################################

## ---------------------------
## libraries
## ---------------------------
library(tidyverse)
library(stringr)

## ---------------------------
## directory paths
## ---------------------------

## -----------------------------------------------------------------------------
## Part 2 - Label each question using comments
## -----------------------------------------------------------------------------

# Q1
string_with_quotes <- "My mom said, \"Saanchi is capable of \'anything \' she sets her mind to \""
print(string_with_quotes)
writeLines(string_with_quotes)

# Of course there was no need to use backslash to achieve this

# Q2
string_with_spchars <- "Wizards welcome, \t enter Diagon Alley, \n muggles tolerated, \t enter Knockturn Alley"
print(string_with_spchars)
writeLines(string_with_spchars)

# Q3
string_with_backslahes <- 'S\\a\\a\\n\\c\\h\\i'
print(string_with_backslahes)
writeLines(string_with_backslahes)

# Q4
# Print literally prints out the string with all of the characters in the string. 
# The print function displays how R saved the string while Writelines shows how the string is read. 
# Writelines will actually escape using backslash and other special characters. 
# For me, the analogy here is that print is like the gene/dna and writelines is the transcribed RNA 
# which is what we read to understand the final protein created.



## -----------------------------------------------------------------------------
## Part 3 - Label each question using comments
## -----------------------------------------------------------------------------

# Q1

str_view_all(string = string_with_quotes, pattern = "'")

# Q2

str_view_all(string = string_with_quotes, pattern = '"')

# Q3

str_view_all(string = string_with_spchars, pattern = '\t')

# Q4

str_view_all(string = string_with_spchars, pattern = '\n')

# Q5

str_view_all(string = string_with_backslahes, pattern = '\ ')


## -----------------------------------------------------------------------------
## Part 4 - Label each question using comments
## -----------------------------------------------------------------------------

# Q1 
text <- c("In 5... 4... 3... 2...",
          "It can cost anywhere between $50 to $100 (... or even $1k!)",
          "These are parenthesis (), while these are brackets []... I think.")

# Q2
str_view_all(string = text, pattern = "I")

# Q3
str_view_all(string = text, pattern ='\\.')

# Q4
str_view_all(string = text, pattern ='\\d+')

# Q5
str_view_all(string = text, pattern ='\\$\\d+\\w')

# Q6
str_view_all(string = text, pattern = "\\...")

# Q7
str_view_all(string = text, pattern = "\\([^()]+\\)|\\(|\\)") # I was thinking any content that begins with parentheses or the parentheses themselves

str_view_all(string = text, pattern = "\\(.*?\\)") # lazy matching - wiildcard matches all non zero characters within parentheses

str_view_all(string = text, pattern = "\\(.*\\)") # This says any non-zero character must match

# Q8
str_view_all(string = text, pattern = "[a-zA-Z]")

# Q9
str_view_all(string = text, pattern = "\\w{4,}|\\...")

# Q10

str_view_all(string = text, pattern = "([0-9AEIOWaeiow])\\1")

## -----------------------------------------------------------------------------
## Part 5 - Label each question using comments
## -----------------------------------------------------------------------------


# Paste the url to your issue here: https://github.com/anyone-can-cook/rclass2_student_issues_w23/issues/390 
# Paste the url to the issue you responded to here: https://github.com/anyone-can-cook/rclass2_student_issues_w23/issues/385 

## -----------------------------------------------------------------------------
## Part 6 - Extra credit
## -----------------------------------------------------------------------------

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("biovizBase")
browseVignettes("biovizBase")

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("Homo.sapiens")

if (!require("BiocManager", quietly = TRUE))
  install.packages("BiocManager")

BiocManager::install("ggbio")

library(ggbio)
library(Homo.sapiens)

# Plotting chromosome 17 with the genomic region of the gene NF1 which causes neurofibromatosis

data(genesymbol, package="biovizBase")
oo <- genesymbol["NF1"]
ap1 <- autoplot(Homo.sapiens, which=oo, gap.geom = "chevron")
attr(ap1, "hasAxis") = TRUE
ap1 + xlab("chr17")

## -----------------------------------------------------------------------------
## END SCRIPT
## -----------------------------------------------------------------------------
