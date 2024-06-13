library(ggplot2)
library(dplyr)
install.packages("tidytext")
library (tidytext)
library(gsheet)
install.packages("wordcloud2")
library(wordcloud2)
install.packages("sentimentr")
library(sentimentr)
library(lubridate)


#load dataset 
survey <- gsheet::gsheet2tbl('https://docs.google.com/spreadsheets/d/1W9eGIihIHppys3LZe5FNbUuaIi_tfdscIq521lidRBU/edit?usp=sharing')



# Create a variable named date_time in your survey data. This should be based on the Timestamp variable. Use the mdy_hms variable to created a “date-time” object.

survey2 <- survey %>% 
  mutate (date_time = mdy_hms(Timestamp))

#Create a visualization of the date_time variable.

survey2 <- survey %>% 
  mutate (date_time = mdy_hms(Timestamp))  

ggplot ( data = survey2, aes(x = date_time )) +   
  geom_histogram() 
  
  
  # Create an object called sentiments by running the following:
  
sentiments <- get_sentiments('bing')


#Explore the sentiments object. How many rows? How many columns? What is the unit of observation.

ncol(sentiments) #2 
nrow (sentiments) # 6786
# sentiments ( positive and negative )


#create an object named words
words <- survey %>%
  dplyr::select(first_name,
                feeling_num,
                feeling) %>%
  unnest_tokens(word, feeling)

# Unit of observation ( feeling_num)

#  Look up the help documentation for the function wordcloud2. What does it expect as the first argument of the function?

# Create a dataframe named word_freq. This should be a dataframe which is conformant with the expectation of wordcloud2, showing how frequently each word appeared in our feelings.

word_freq <- words %>% 
  group_by (word) %>%
  tally()
# make word cloud 
wordcloud2(word_freq)
