#Load data
Nd<-read.csv("C:\\Users\\Sagar\\Downloads\\NewspaperData.csv")

# Visualization
boxplot(Nd$sunday,col="dodgerblue4")
boxplot(Nd$daily,col="dodgerblue4")

#Regression equation
#Syntax  model<-lm(y~x,data=data set name)
#column names
data1=data.frame(daily=(c(300,400)),sunday=(c(200,250)))
marge_data = rbind.data.frame(Nd[-1],data1)
colnames(Nd)
#Model building
model<- lm(sunday~daily,data =Nd[,-1])
summary(model)
#Preparing new data frame with new data
new_daily=data.frame(daily=c(391.952))
#Predict for the new data
sun1=predict(model,new_daily)
#Print predicted value
sun1

#Predict for daily variable from the historical data
pred<-predict(model)
#Print predicted values
pred
#Prepare a new data frame with pred and error
finaldata<-data.frame(Nd,pred,"Error"= Nd$sunday-pred)
finaldata
