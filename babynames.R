# load lib 

install.packages("babynames")
library(babynames)
bb_names <- babynames

# Create a histogram of the name Marie in 1982.
install.packages("ggplot")
 

ggplot(babynames %>% filter(name == "Marie", year>=1982, sex == "F"),aes(x = year, y = prop))+
  geom_line () +
  labs (title = "Marie in History", x = "Names", y= "proportion")


# Number of people named "Marie" + sex
bb_names %>% 
  group_by(sex) %>%
  filter(name== "Marie", sex == "F",) %>% 
  tally ()


# Create a line plot for proportion of the name Joe, colored by sex. Make the lines a bit thicker and more transparent.


ggplot(babynames %>% filter(name == "Joe"),aes(x = year, y = prop, colour = sex))+
  geom_line () +
  labs (title = "Joe in History", x = "Names", y= "proportion")


# Create a bar chart of all female names in 2002.

Women2002 <- bb_names %>% 
  filter (sex == "F", year== 2002) %>% 
  arrange (desc(n)) %>% 
  head (10)

ggplot(data = Women2002, aes(x=name, y=n)) +
  geom_col (fill = "blue", alpha = 0.2) +
   labs(title = "Women names of 2002" , x = "Names", y="proportion")+
  theme_gray()
  

# 15) Create a new data set called the_nineties that only contains years from the 1990s.

year <- bb_names %>% 
  filter (year == 1990)  

write_csv(the_nineties, file = "bbnames_nineties.csv")

