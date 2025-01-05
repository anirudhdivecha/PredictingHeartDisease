# STATS 202A Final Project
# Anirudh Divecha

#set the working directory

setwd("/Users/anirudhdivecha/R_Projects/STAT 202A/final project")
getwd()

# read in csv file checked by python script
heart_data = read.csv("cleaned_heart.csv")

num_table = table(heart_data$num)

# Plot a histogram of the frequencies
barplot(num_table, 
        main = "Histogram of Response Variable 'num'", 
        xlab = "'num' Levels", 
        ylab = "Frequency", 
        col = "skyblue", 
        border = "black")



######################### Kernel Density Estimation
# lets do kernel density estimation on some of the continuous data predictors
system("R CMD SHLIB hw3.c")
dyn.unload("hw3.so")
dyn.load("hw3.so")

# lets examine the trestbps kernel density estimation
trestbps = as.numeric(heart_data[,4])
trestbps_bandwidth = bw.nrd(trestbps)

trestbps_grid = seq(min(trestbps),max(trestbps),length=100)
result = .C("gkr",x = trestbps, y = double(length(trestbps_grid)), n = as.integer(length(trestbps)), b = as.double(trestbps_bandwidth),
            g = trestbps_grid, m = as.integer(length(trestbps_grid)))


# lets compare men and women kernel density estimation
males_data = heart_data[heart_data$sex == 0, ]
females_data = heart_data[heart_data$sex == 1, ]

trestbps_m = as.numeric(males_data[,4])
trestbps_bandwidth_m = bw.nrd(trestbps_m)

trestbps_grid_m = seq(min(trestbps_m),max(trestbps_m),length=100)
result_trestbps_m = .C("gkr",x = trestbps_m, y = double(length(trestbps_grid_m)), n = as.integer(length(trestbps_m)), b = as.double(trestbps_bandwidth_m),
                       g = trestbps_grid_m, m = as.integer(length(trestbps_grid_m)))

trestbps_f = as.numeric(females_data[,4])
trestbps_bandwidth_f = bw.nrd(trestbps_f)

trestbps_grid_f = seq(min(trestbps_f),max(trestbps_f),length=100)
result_trestbps_f = .C("gkr",x = trestbps_f, y = double(length(trestbps_grid_f)), n = as.integer(length(trestbps_f)), b = as.double(trestbps_bandwidth_f),
                       g = trestbps_grid_f, m = as.integer(length(trestbps_grid_f)))

plot(type = "l", ylim = c(0, 0.025), trestbps_grid, result$y, xlab="Resting Blood Pressure Magnitudes (in mm Hg)", ylab="Kernel Estimates", main="Kernel Density for Resting Blood Pressure Magnitudes", col="red")
lines(trestbps_grid_m, result_trestbps_m$y, col = "blue")
lines(trestbps_grid_f, result_trestbps_f$y, col = "green")
legend("topright", legend = c("Male and Female", "Male Only", "Female Only"), col = c("red", "blue", "green"), lwd = 2)


# now lets take a look at the Thalach kernel density estimation
thalch = as.numeric(heart_data[,8])
thalch_bandwidth = bw.nrd(thalch)

thalch_grid = seq(min(thalch),max(thalch),length=100)
result_thalch = .C("gkr",x = thalch, y = double(length(thalch_grid)), n = as.integer(length(thalch)), b = as.double(thalch_bandwidth),
                   g = thalch_grid, m = as.integer(length(thalch_grid)))


# lets compare men and women kernel density estimation
thalch_m = as.numeric(males_data[,8])
thalch_bandwidth_m = bw.nrd(thalch_m)

thalch_grid_m = seq(min(thalch_m),max(thalch_m),length=100)
result_thalch_m = .C("gkr",x = thalch_m, y = double(length(thalch_grid_m)), n = as.integer(length(thalch_m)), b = as.double(thalch_bandwidth_m),
                     g = thalch_grid_m, m = as.integer(length(thalch_grid_m)))

thalch_f = as.numeric(females_data[,8])
thalch_bandwidth_f = bw.nrd(thalch_f)

thalch_grid_f = seq(min(thalch_f),max(thalch_f),length=100)
result_thalch_f = .C("gkr",x = thalch_f, y = double(length(thalch_grid_f)), n = as.integer(length(thalch_f)), b = as.double(thalch_bandwidth_f),
                     g = thalch_grid_f, m = as.integer(length(thalch_grid_f)))

plot(type = "l", ylim = c(0, 0.025), thalch_grid, result_thalch$y, xlab="thalch Magnitudes", ylab="Kernel Estimates", main="Kernel Density for thalch Magnitudes", col="red")
lines(thalch_grid_m, result_thalch_m$y, col = "blue")
lines(thalch_grid_f, result_thalch_f$y, col = "green")
legend("topleft", legend = c("Male and Female", "Male Only", "Female Only"), col = c("red", "blue", "green"), lwd = 1)


# Cholesterol Kernel Density Estimation
cholesterol = as.numeric(heart_data[,5])
cholesterol_bandwidth = bw.nrd(cholesterol)

cholesterol_grid = seq(min(cholesterol),max(cholesterol),length=100)
result_cholesterol = .C("gkr",x = cholesterol, y = double(length(cholesterol_grid)), n = as.integer(length(cholesterol)), b = as.double(cholesterol_bandwidth),
                        g = cholesterol_grid, m = as.integer(length(cholesterol_grid)))

# lets compare men and women kernel density estimation
cholesterol_m = as.numeric(males_data[,5])
cholesterol_bandwidth_m = bw.nrd(cholesterol_m)

cholesterol_grid_m = seq(min(cholesterol_m),max(cholesterol_m),length=100)
result_cholesterol_m = .C("gkr",x = cholesterol_m, y = double(length(cholesterol_grid_m)), n = as.integer(length(cholesterol_m)), b = as.double(cholesterol_bandwidth_m),
                          g = cholesterol_grid_m, m = as.integer(length(cholesterol_grid_m)))

cholesterol_f = as.numeric(females_data[,5])
cholesterol_bandwidth_f = bw.nrd(cholesterol_f)

cholesterol_grid_f = seq(min(cholesterol_f),max(cholesterol_f),length=100)
result_cholesterol_f = .C("gkr",x = cholesterol_f, y = double(length(cholesterol_grid_f)), n = as.integer(length(cholesterol_f)), b = as.double(cholesterol_bandwidth_f),
                          g = cholesterol_grid_f, m = as.integer(length(cholesterol_grid_f)))

plot(type = "l", ylim = c(0, 0.010), cholesterol_grid, result_cholesterol$y, xlab="Cholesterol Magnitudes (in mg/dl)", ylab="Kernel Estimates", main="Kernel Density for Cholesterol Magnitudes", col="red")
lines(cholesterol_grid_m, result_cholesterol_m$y, col = "blue")
lines(cholesterol_grid_f, result_cholesterol_f$y, col = "green")
legend("topright", legend = c("Male and Female", "Male Only", "Female Only"), col = c("red", "blue", "green"), lwd = 1)






######################### Box Plots
par(mfrow = c(1, 1))
boxplot(trestbps ~ thal, data = heart_data, 
        main = "Boxplot of Resting Blood Pressure vs Thalassemia",
        xlab = "thal", ylab = "trestbps (in mm Hg)",
        col = c("lightblue", "pink"))







######################### Logistic Regression
# do an 90-10 split of data
num_rows=nrow(heart_data)
num_rows


train = heart_data[1:270,]
test = heart_data[271:299,]

# treat categorical variables as factors
train$sex = factor(train$sex)
train$cp = factor(train$cp)
train$fbs = factor(train$fbs)
train$restecg = factor(train$restecg)
train$thal = factor(train$thal)

# fit logistic model on training data
hlm = glm(train$num ~ age + sex + cp + trestbps + chol + fbs + restecg + thalch + thal, 
          data = train, family = "binomial")

summary(hlm)

test$sex = factor(test$sex)
test$cp = factor(test$cp)
test$fbs = factor(test$fbs)
test$restecg = factor(test$restecg)
test$thal = factor(test$thal)

# obtain initial accuracy results
fitted.results = predict(hlm,newdata=test,type='response')
fitted.results = ifelse(fitted.results > 0.5,1,0)
misClasificError = mean(fitted.results != test$num)
print(paste('Accuracy',1-misClasificError))

# lets refit the model with significant terms
hlm_1 = glm(train$num ~ sex + cp + trestbps + restecg + thalch + thal, 
          data = train, family = "binomial")

summary(hlm_1)

# obtain final accuracy results
fitted_1.results = predict(hlm_1,newdata=test,type='response')
fitted_1.results = ifelse(fitted_1.results > 0.5,1,0)
misClasificError_1 = mean(fitted_1.results != test$num)
print(paste('Accuracy',1-misClasificError_1))





############################### KNN Model
# Lets try the KNN model
library(ggplot2)
library(caret)

train_knn = heart_data[1:270,]
test_knn = heart_data[271:299,]

# for caret package outcome
train_knn$num = as.factor(train_knn$num)
test_knn$num = as.factor(test_knn$num)

set.seed(123)
knn_model = train(num ~ age + sex + cp + trestbps + chol + fbs + restecg + thalch + thal, method = "knn", 
                   data = train_knn,
                   tuneGrid = data.frame(k = seq(9, 71, 2)))
ggplot(knn_model, highlight = TRUE)

predictions = predict(knn_model, test_knn)
confusionMatrix(predictions, test_knn$num)

# The KNN performed slightly worse



############################### ROC Curves to Analyze the Models
library(pROC)
# Predicted probabilities from logistic regression
log_reg_probs = predict(hlm,newdata=test,type='response')

# Generate the ROC curve
log_reg_roc = roc(test$num, log_reg_probs)
plot(log_reg_roc, col = "blue", main = "ROC Curves")


# Predicted probabilities from k-NN
knn_probs = predict(knn_model, newdata = test_knn, type = "prob")[, 2]

# Generate the ROC curve
knn_roc = roc(test_knn$num, knn_probs)
plot(knn_roc, col = "red", add = TRUE)

legend("bottomright", legend = c("Logistic Regression", "kNN"), col = c("blue", "red"), lwd = 1)
# we see from the ROC curves that the logistic regression line is farther to the left showing better performance than the kNN model.

roc_test = roc.test(log_reg_roc, knn_roc)

# Print results
print(roc_test)

# the ROC.test is DeLong's test and we see that the logistic regression model performs better by the p-value is 0.43, 
# this indicates however that the difference between the two models is not statistically significant. 






