

#################### Manipulates data #################### 


# pipes

essdata %>% head()


# tibble

essdata <- essdata %>% as_tibble(); essdata


# select columns 

essdata %>% select(cntry,gndr,yrbrn,eisced) 


# filter rows that meet logic condition 

essdata %>% filter(cntry!="AT" & yrbrn>1990)


# assign a new variable into the data frame

essdata %>% mutate(age = 2019 - yrbrn)


# encatenate this functions at will. Remember that the instruction a the right side 
# of a pipe operates on the results of the chain of instructions on the left side.


essdata_sub <- essdata %>% select(cntry,gndr,yrbrn,eisced) %>% 
	filter(cntry!="AT" & yrbrn>1990, eisced!=55) %>%
	mutate(age = 2019 - yrbrn) %>%
	mutate(gndr_string = case_when(gndr == 1 ~ "Male", gndr == 2 ~ "Female"))



#################### Basic data analysis  #################### 


# descriptives

essdata_sub %>% summarise(mean = mean(age), sd = sd(age))

essdata_sub %>% count(gndr_string)

# by group

summary_bygroup <- essdata_sub %>% group_by(cntry,gndr_string) %>% 
summarise(mean_educ = mean(eisced, na.rm=TRUE), mean_age = mean(age, na.rm=TRUE)) %>%
arrange(gndr_string)


# reshape, from wide to long

summary_bygroup 

summary_bygroup_long <- summary_bygroup %>% gather(key = var, value=mean, c(mean_educ,mean_age)) 





 
