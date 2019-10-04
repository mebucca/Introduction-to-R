

#################### ggplots  #################### 


# ggplots are built layer by layer

p <- essdata_sub %>% filter(!is.na(gndr_string)) %>%
	ggplot(aes(x=age, y=eisced)) 

p + geom_point()


p + geom_point(colour="blue", alpha = 0.1)


# Create a jitter object for reproducible jitter:

jitter <- position_jitter(width = 1, height = 1)

p <- p + geom_point(colour="blue", alpha = 0.1, position = jitter)



# more options

myplot <- essdata_sub %>% filter(!is.na(gndr_string)) %>%
	ggplot(aes(x=age, y=eisced, group= gndr_string, colour=gndr_string)) +
	geom_point(alpha = 0.1, position = jitter) +
	geom_smooth(method=lm,   # Add linear regression lines
                se=FALSE,    # Don't add shaded confidence region
                fullrange=TRUE) + # Extend regression lines
	scale_color_aaas() +
	scale_fill_aaas() 



filename <- paste0(dirresults,"myfirstrplot.png")
save_plot(filename, myplot, base_width=15, base_height=14, units="cm")




################ regression models  ################## 


# Fit linear model

model1 <- lm(eisced ~ age + I(age^2) + factor(gndr_string), data=essdata_sub); model1


# Update an existing model 
model2 <- update(model1, . ~ . + factor(gndr_string)*age + factor(gndr_string)*I(age^2)); model2


# access output 

names(model2)

model2$coefficients 
model2$residuals 


# summary fuction

sum_model2 <- summary(model2); sum_model2 
names(sum_model2)

sum_model2$r.squared
sum_model2$sigma


# export result into a nice table

filename <- paste0(dirresults,"myfirstrlm.txt")


stargazer(model1, model2, type="text",
dep.var.labels=c("Education","Education"),
covariate.labels=c("Age","Age2","Gender (Male=1)", "Gender*Age","Gender*Age2","Intercep"),
 out=filename)


########### Create prediction and plot from model  ############# 


# create a data grid

mygrid <- essdata_sub %>% data_grid(age= c(20,30,40,50), gndr_string = c("Female","Male") , .model = model2); mygrid

predictions <- predict(model2,newdata=mygrid )

pred_df <- cbind(mygrid,predictions) %>% as_tibble(); pred_df


pred_plot <-pred_df %>% 
	ggplot(aes(x=age, y=predictions, group= gndr_string, colour=gndr_string)) +
	geom_line(size=1) +
	labs(x="age", y="predicted education", title="Eduucational attainment by age and gender") + 
	scale_color_aaas() +
	scale_fill_aaas() 


filename <- paste0(dirresults,"plotpred.png")
save_plot(filename, pred_plot, base_width=15, base_height=14, units="cm")



