################################################################################
##
## [ PROJ ] < Problem set #9 >
## [ FILE ] < pa9_Cousins_SarahJ >
## [ AUTH ] < Sarah J. Cousins/SJC0usins >
## [ INIT ] < Due 3/17/23 >
##
################################################################################

## ---------------------------
## libraries
## ---------------------------
library(stringr)
library(tidyverse)
library(ggplot2)
library(tm)
library(ggwordcloud)


## ---------------------------
## directory paths
## ---------------------------
plots_dir <- file.path('.', 'bonus plot ps9')


## -----------------------------------------------------------------------------
## Part I: Setting up repository
## -----------------------------------------------------------------------------

#Done! Git commands at end of script.

## -----------------------------------------------------------------------------
## Part II: Backslash (\) escape character
## -----------------------------------------------------------------------------

# Q 2.1

#String w/ single quote (') and double quote (") inside the string, saved as an object called string_with_quotes. 
string_with_quotes<-"I said, \"I don\'t know if a word contraction \'counts\' as a single quote.\""

writeLines(string_with_quotes) #writeLine() prints text after executing special meaning
#OUTPUT: I said, "I don't know if a word contraction 'counts' as a single quote."

print(string_with_quotes) #print() prints the literal text, not its special meaning
#OUTPUT: [1] "I said, \"I don't know if a word contraction 'counts' as a single quote.\""


#Q 2.2

#String that contains tab and newline special characters, saved as object string_with_spchars. 

string_with_spchars<- "To Do \t Done? \n Rest \t No \n Work \t Yes" # contains \t tab and \n newline

writeLines(string_with_spchars)
#OUTPUT: To Do 	 Done? 
#         Rest 	 No
#         Work 	 Yes


#Q 2.3
#Created a string that contains my first name, ea letter  separated by a backslash, saved  to string_with_backslashes. 

string_with_backslashes<- "S\\a\\r\\a\\h" #using double \\ to show intended \

writeLines(string_with_backslashes)
#OUTPUT: S\a\r\a\h


#Q. 2.4.
#As noted in my comments in line 41 and 44 above, print() prints the literal text, not its special meaning while writeLine() prints text after executing special meaning.

## -----------------------------------------------------------------------------
## Part III: Matching characters
## -----------------------------------------------------------------------------

####Helpful website to remember later to trial codes: https://regex101.com/#####


#Q 3.1                                

#Show all matches to single quotes (') in  string_with_quotes created in Part II.
str_view_all(string_with_quotes, "\'") #for some reason it doesn't want string= and pattern =???
#OUTPUT: [1] │ I said, "I don<'>t know if a word contraction <'>counts<'> as a single quote."
   
 
#Q 3.2  

#Show all matches to double quotes (") in  string_with_quotes created in Part II.
str_view_all(string_with_quotes, "\"") 
#OUTPUT: [1] │ I said, <">I don't know if a word contraction 'counts' as a single quote.<">

                                  
#Q 3.3

#All matches to tab characters in string_with_spchars.
str_view_all(string_with_spchars, "\\t") 
#OUTPUT
#[1] │ To Do <{\t}> Done? 
#    │  Rest <{\t}> No 
#    │  Work <{\t}> Yes


#Q. 3.4

#All matches to newline characters in string_with_spchars.
#the carrots are the highlights in the output.  
str_view_all(string_with_spchars, "\\n") 
#OUTPUT:                                              
#[1] │ To Do {\t} Done? <
#    │ > Rest {\t} No <
#    │ > Work {\t} Yes


#Q 3.5

#All matches to backslashes (\) in string_with_backslashes.
str_view_all(string_with_backslashes, "\\\\")
#OUTPUT: [1] │ S<\>a<\>r<\>a<\>h


## -----------------------------------------------------------------------------
## Part IV: Regular expressions
## -----------------------------------------------------------------------------
#A website I found more helpful: https://dept.stat.lsa.umich.edu/~jerrick/courses/stat701/notes/stringmanip.html

#Q 4.1

#Copied the PS code to create the character vector text:
text <- c("In 5... 4... 3... 2...",
          "It can cost anywhere between $50 to $100 (... or even $1k!)",
          "These are parenthesis (), while these are brackets []... I think.")


#Q 4.2

#Show all matches to a capital I at the beginning of the string.
str_view_all(string = text, pattern = "^I")          
#OUTPUT: 
#[1] │ <I>n 5... 4... 3... 2...
#[2] │ <I>t can cost anywhere between $50 to $100 (... or even $1k!)


#Q 4.3  

#Show all matches to a period at the end of the string (we use $ for end). 
str_view_all(string = text, pattern = "\\.$")                  
#OUTPUT:
#[1] │ In 5... 4... 3... 2..<.>
#[2] │ It can cost anywhere between $50 to $100 (... or even $1k!)
#[3] │ These are parenthesis (), while these are brackets []... I think<.>
 

#Q 4.4

#Show all matches to 1 or more digits.
str_view_all(string = text, pattern = "\\d+") 
#remember {x} is exactly x# digits whereas + means more than
 
 
#Q 4.5 

#Show all matches to all dollar amounts, $ sign and k if there is one (i.e., $50, $100,$1k)
str_view_all(string = text, pattern = "\\$\\d+k?")
#thinking through the steps
#str_view_all(string = text, pattern = "\\$")  #find dollar
#str_view_all(string = text, pattern = "\\d+") #find 1 or more digits (1,10, 100 etc)
#str_view_all(string = text, pattern = "\\d+k?") #optional find following a digit; ? = 0 or 1 k only
#OUTPUT
#[1] │ In <5>... <4>... <3>... <2>...
#[2] │ It can cost anywhere between $<50> to $<100> (... or even $<1>k!)
#[3] │ These are parenthesis (), while these are brackets []... I think.


#Q 4.6 

#Show all matches to ellipses (...)
str_view_all(string = text, pattern = "\\...")
#OUTPUT
#[1] │ In 5<...> 4<...> 3<...> 2<...>
#[2] │ It can cost anywhere between $50 to $100 (<...> or even $1k!)
#[3] │ These are parenthesis (), while these are brackets []<...> I think.

                            
#Q 4.7

#Show all matches to parentheses, including the contents between the parentheses if there are any.
str_view_all(string = text, pattern = "\\(.*\\)") #finds all parentheses 
#notes:  \(?       # optional opening parenthesis
#OUTPUT
#[1] │ In 5... 4... 3... 2...
#[2] │ It can cost anywhere between $50 to $100 <(... or even $1k!)>
#[3] │ These are parenthesis <()>, while these are brackets []... I think.
  
                                       
#Q 4.8

#Show all matches to words (define words as containing only letters, upper or lowercase)
str_view_all(string = text, pattern = regex("\\w+[a-z]", ignore_case = TRUE)) #regex version - better not to use regex because might be cases where argument not available
str_view_all(string = text, pattern = "\\w+[a-zA-Z]")  #nonregex/more efficient?
#OUTPUT
#[1] │ <In> 5... 4... 3... 2...
#[2] │ <It> <can> <cost> <anywhere> <between> $50 <to> $100 (... <or> <even> $<1k>!)
#[3] │ <These> <are> <parenthesis> (), <while> <these> <are> <brackets> []... I <think>


#Q 4.9

#Show all matches to either a word that’s 4 or more letters long or ellipses.
str_view_all(string = text, pattern = "\\w{4,}|\\...")
#OUTPUT
#[1] │ In 5<...> 4<...> 3<...> 2<...>
#[2] │ It can <cost> <anywhere> <between> $50 to $100 (<...> or <even> $1k!)
#[3] │ <These> are <parenthesis> (), <while> <these> are <brackets> []<...> I <think>.


#Q 4.10

#Show all matches to any digit or vowel (upper or lowercase) that repeats 2 times in a row (i.e., the same digit or vowel repeated twice in a row)

str_view_all(string = text, pattern = "(([aeiouAEIOU])|(\\d))\\1") #without regex
str_view_all(string = text, pattern = regex("(([aeiou])|(\\d))\\1", ignore_case = TRUE))#regex v2

#probably MOST concise?
str_view_all(string = text, pattern = "([aeiouAEIOU0-9])\\1")
#other efforts trying to make it more concise
str_view_all(string = text, pattern = "([(\\d)aeiouAEIOU])\\1") #another version without regex
str_view_all(string = text, pattern = regex("([(\\d)aeiou])\\1", ignore_case = TRUE))#regex v1
#Notes: \\1 finds repeats


#OUTPUT
#[1] │ In 5... 4... 3... 2...
#[2] │ It can cost anywhere betw<ee>n $50 to $1<00> (... or even $1k!)
#[3] │ These are parenthesis (), while these are brackets []... I think.


## -----------------------------------------------------------------------------
##  Extra Credit GGPLOT
## -----------------------------------------------------------------------------

#creating ggplot world cloud

png(file.path(plots_dir, 'ps9_bonusplot_CousinsSarahJ.png'))
set.seed(42)
ggplot(
  HateFreq2,
  aes(
    label = words, size = Freq,
    color = Freq)
) +
  ggtitle("Figure 1. Top 20 Words Spoken on KTTV-Fox Evening News \n(Los Angeles, CA at 6:00 PM on August 25, 2022)")+
  labs(caption = "Data: UCLA Hate Initiative. PIs: Padwa/Khurana. Author: Sarah J. Cousins Date: 3/13/23")+
  geom_text_wordcloud_area() +
  scale_size_area(max_size = 20) +
  theme_minimal() +
  scale_color_gradient(low = "darkblue", high = "blue")
dev.off()


#########DATA PREP###############

#removing if redoing
#rm(hate)
#rm(myTdm)
#rm(FreqMat)
#rm(HateFreq)
#rm(HateFreq2)

#importing pilot data from one show
hate <- read.csv("./bonus plot ps9/houseless1921.csv", stringsAsFactors = FALSE)

#Creating a list of words and their frequencies associated 
data("hate")
myTdm <- as.matrix(TermDocumentMatrix(hate))
FreqMat <- data.frame(words = rownames(myTdm), 
                      Freq = rowSums(myTdm), 
                      row.names = NULL)

write.csv(HateFreq, "/Users/SCousins/Documents/Box Sync/Doctoral Education 2022/EDUC 260B W23/problem sets/ps9/ps9_coffeerus/bonus plot ps9/HateFreq.csv", row.names=FALSE)

#cleaned a little more
HateFreq2 <- read.csv("./bonus plot ps9/HateFreq2.csv", stringsAsFactors = FALSE)


## -----------------------------------------------------------------------------
##  Part V: Create a GitHub issue
## -----------------------------------------------------------------------------

Replied: https://github.com/anyone-can-cook/rclass2_student_issues_w23/issues/392
Posted: https://github.com/anyone-can-cook/rclass2_student_issues_w23/issues/386  


## -----------------------------------------------------------------------------
## GIT TERMINAL COMMANDS // STEPS
## -----------------------------------------------------------------------------
#since always start at ps2...
cd..
cd..
cd ps9
#initating and linking remote to local
git clone https://github.com/anyone-can-cook/ps9_coffeerus
cd ps9_coffeerus
#creating dev branch
git checkout -b dev_Cousins_SarahJ
#blah blah, doing assignment but now ready to send to remote/coffeerus

#confirming i'm on dev branch -- could also use git status
git branch -a
#adding while on my dev branch
#from dev branch [[check to see what actually needs to be pushed once complete]]
git add ps9_Cousins_SarahJ.R
git add ps9_bonusplot_CousinsSarahJ.png
git status
git commit -m "inital commit and merge"
#switch to main, pull, merge and push
git checkout main
git pull
git merge dev_Cousins_SarahJ_ps9
git push
##dont need this right:git push --set-upstream dev_Cousins_SarahJ_ps9 main


## -----------------------------------------------------------------------------
## END SCRIPT
## -----------------------------------------------------------------------------
