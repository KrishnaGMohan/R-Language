#------------------------------------
# Demo 12: DataFrames: 
# Creating a Data Frame
#------------------------------------
emp.id <- c(2501, 4672, 3520, 2119, 1874)
emp.fname <- c("Joe", "Lynda", "Zarook", "Edwin", "Brian")
emp.dept <- c("Marketing", "Personnel", "Operations", "Marketing", "Operations")
emp.DOJ <- c(as.Date("2013-04-15"),
                as.Date("2015-08-22"),
                as.Date("2014-06-12"),
                as.Date("2013-01-11"),
                as.Date("2014-11-21"))
emp.salary <- c(75000, 65000, 58000, 69000, 62000)

empDF <- data.frame(emp.id, emp.fname, emp.dept, emp.DOJ, emp.salary)
empDF

colnames(empDF) <- c("empid", "fname", "dept", "doj", "salary")
empDF

str(empDF)

#------------------------------------
# Demo 13: DataFrames: 
# Adding Rows and Columns
#------------------------------------
#Adding a Row
newEmp <- data.frame(7856, "Fiona", "Marketing", Sys.Date(), 62000)
colnames(newEmp) <- colnames(empDF)
empDF <- rbind(empDF, newEmp)
empDF

#Adding a Column
emp.cityid <- c(3, 5, 2, 2, 4, 5)
empDF <- cbind(empDF, emp.cityid)
colnames(empDF) <- c(colnames(empDF)[1:5], "cityid")
empDF

#------------------------------------
# Demo 14: DataFrames: 
# Merging DataFrames by common column
#------------------------------------

city.id <- c(3, 2, 5, 4)
city.name <- c("Ottawa", "Vancouver", "Calgary", "Toronto")
cityDF <- data.frame(city.id, city.name)
colnames(cityDF) <- c("cityid", "city")

cityDF

empDF <- merge(empDF, cityDF, by = "cityid")
empDF

#------------------------------
# Editing a Data Frame
temp <- edit(empDF)
empDF <- temp # If satisfied withe the changes
#------------------------------

#------------------------------------
# Demo 15: DataFrames: 
# Selecting elements
#------------------------------------

empDF$fname
empDF[2,6]
empDF[3, "salary"]
empDF[3:5, 2:4]
empDF[substr(empDF$fname,1,1) == "Z", ]
empDF[empDF$salary > 65000, c("fname", "dept", "salary")]
aggregate(empDF$salary ~ empDF$city, empDF, sum)

subset(empDF, select = c(fname), dept == "Marketing" & salary > 65000)
subset(empDF, select = -c(cityid, empid, doj))

#------------------------------------
# Demo 16: DataFrames: 
# Removing NAs from a DataFrame
#------------------------------------
#Prepraration
empDF[4,"salary"] <- NA
empDF[2, "salary"] <- NA
empDF

# Removal of NAs
mean(empDF$salary)
mean(na.omit(empDF$salary))


#------------------------------------
# Demo 16a: DataFrames: 
# Easier DataFrame operations
#------------------------------------
with(empDF, mean(salary))

attach(empDF)
mean(salary)
aggregate(salary ~ city, empDF, sum)
detach(empDF)


ts1 <- ts(1:15, start = c(2015, 1), frequency = 4)
str(ts1)
