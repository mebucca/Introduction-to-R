
##################### THE R LENGUAGE #####################


################## Main types of objects #################


greetings <- "Hello world" 

a_constant <- 3

4 -> another_constant



# Vectors 

u <- c(1,2,3,4,5,6)

v <- rep(1,6)

w <- seq(from=1,to=3.5,by=0.5)

x <- 6:11


# You can combine these. E.g:

uu <- rep(u,2)

uv <- c(u,v)

some_letters <- c("A","B","C","D")



# Matrices 

M_1 <- cbind(y,w)

M_2 <- rbind(y,w)

a_sample <- sample(M_1, size=100, replace=TRUE)

M_3 <- matrix(a_sample, nrow=10, ncol=10)


# Data frames

df_1 <- data.frame(var1 = y, var2 = w)

df_2 <- as.data.frame(M_1)
names(df_2) <- c("var1","var2")


df_1$var1
df_2$var1


# Lists

my_list <- list(myvector=some_letters, mymatrix=M_2, mydf=df_1)

my_list$mymatrix 


####################### Operations ####################


# Arithmetic 

addition    <- a_constant + another_constant
substaction <- a_constant - another_constant
product     <- a_constant*another_constant
ratio       <- a_constant/another_constant
power       <- a_constant^3
root        <- a_constant^(1/3)
natlog      <- log(a_constant)


# Vector operations


y <- c(3,1,2,4,6,5)
x <- c(5,2,6,5,7,1)


# quantities 
n <- length(y)

sum_y <- sum(y)

min_y <- min(y)

max_y <- max(y)

range_y <- range(y)

rank_y <- rank(y)

sort_y <- sort(y)

add_vectors  <- y + x

add_vector_const <- y + 1

lincom_vector <- 2*x + y





# all math operations on vectors and matrices are interpreted as "element wise" operations. Example:

x/y
(y+x)/n

# %*% is vector/matrix multiplication

dot_product <- t(x)%*%y

outer_product <- x%*%t(y)

# Some linear algebra (matrix operations)


transpose   <- t(M_2)
elementwise <- M_2*M_2

matrix_mult_1 <- M_2%*%t(M_2)
matrix_mult_2 <- t(M_2)%*%M_2


# Logic operations


# <	less than
# <=	less than or equal to
# >	greater than
# >=	greater than or equal to
# ==	exactly equal to
# !=	not equal to
# !x	Not x
# x | y	x OR y
# x & y	x AND y
# isTRUE(x)	test if X is TRUE



y>3

(y>3)*1

u==v

u!=v


# subseting

y[1]

y[c(1,3)]

y[-c(1,3)]

y[3:length(y)]

names(y) <- paste("Name", 1:length(y), sep = "")
y
y[c("Name1","Name5")]


y[which(y<2 | y>=5)]

y[y<2 | y>=5]


# assignment to subset

y[y<2 | y>=5] <- 0



# Missing values 


y <- c(3,1,NA,4,6,NA)

is.na(y)


y[is.na(y)==TRUE] <- 1

####################### Functions ####################


my_function <- function(x) {
		fx <- log(x + (x^2)/2 + (x^3)/3 + (x^4)/4 + (x^5)/5)
		return(fx)
	}


my_function(1)
my_function(2)



####################### Loops  ####################


for (i in 1:50) {
	r <- my_function(i)
	print(r) 
}


my_function(1:50)


####################### Plot  ####################

x <- 1:50
x <- as.matrix(1:50)
y <- my_function(1:50)


plot(x,y, col="red", ylab="log(x + x^2/2 + ... + x^5/5", main="My first function!")