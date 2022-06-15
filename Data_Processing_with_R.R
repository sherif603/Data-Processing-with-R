# Data Processing with R Programming Language
# By Sherif Sakr, Cairo Egypt, 15 June 2022

# Loading Data
emp <- read.table("C:/Users/hp/Documents/Sherif_Project_7_11_2021/Emp.txt", header = TRUE)

# Use the head() function to return the first part of a vector, matrix, table, data frame, or function
head(emp,3)

# Use the View() function in R invokes a spreadsheet-style data viewer on a matrix-like R object.
View(emp)

# Use str() function for compactly displaying the internal structure of a R object.
str(emp)

# Converting Data
# Convert "ENAME" column from factor to a character
emp$ENAME <- as.character(emp$ENAME)
# convert "HIREDATE" column from character to a date 
emp$HIREDATE <- as.Date(emp$HIREDATE, format = "%d/%m/%Y")

# Selecting Data
emp[,c("ENAME", "JOB", "SAL")]

# Combining Data
# Select two columns and combine them
data.frame(emp$SAL,emp$ENAME)

# Add labels to columns
data.frame("Salary" = emp$SAL, "Employee_Name" = emp$ENAME)

# Calculate the annual salary
data.frame(emp$ENAME, "Annual_Salary" = emp$SAL * 12)

# Use attach() function to access the variables present in the data framework without
# calling the data frame
attach(emp)
data.frame(ENAME, "Annual_Salary" = SAL * 12)

# Concatenation
# Concatenate two columns
paste(ENAME, "is", JOB)

# Sorting Data
# Sort data by Salary column in ascending order
emp[order(SAL),]
# Sort data by Salary column in descending order
emp[order(SAL, decreasing = TRUE),]
# Sort data by multiple columns
emp[order(JOB, SAL),]
# Sort by "HIREDATE" column, but do not show it
emp[order(HIREDATE), c("ENAME", "SAL")]
# Sorting one column in reverse order
emp[order(DEPTNO, -SAL, decreasing = TRUE),]

# Filtering Data
# Select employees earning more than 2000
emp[SAL > 2000,]
# Select only Managers
emp[JOB == "MANAGER",]
# Select people hired before or on 1 st of April 1981
emp[HIREDATE <= '1981-04-01',]
# Select all Job types except "CLERK"
emp[JOB != "CLERK",]
# Complex Expressions
# Select people earning salary from 1000 to 2000
emp[SAL >= 1000 & SAL <= 2000,]
# Select people working in department no 10 or 20
emp[DEPTNO == 10 | DEPTNO == 20, c("ENAME" ,"DEPTNO")]
# Select managers, clerks and presidents
emp[JOB == "PRESIDENT" | JOB == "CLERK" | JOB == "MANAGER",
    c("ENAME", "JOB")]

# Finding Matches
# Select people with names starting with "B" 
emp[grep("B.*", ENAME),]
# Select people with second letter "A"
emp[grep("^.A", ENAME),]
# Filter data by date ranges
emp[HIREDATE >= as.Date("1981-01-01") & HIREDATE <= as.Date("1981-12-31"),
    c("ENAME", "HIREDATE")]

# Dealing with NA values
# Use is.na() function to find the missing values (NA)
is.na(emp)
# Use colSums() function with is.na() function to count the NA values
colSums(is.na(emp))
# Use which() function returns the position of the column(s) with at least one NA.
which(is.na(emp))
# Use names() function
names(which(is.na(emp)))
# Convert the NA values to 0
data.frame(ENAME, SAL, COMM + ifelse(is.na(COMM),0,COMM))
# Select employees with commission more than 300
emp[COMM > 300,]
# Remove all rows with NA values in any column
na.omit(emp[COMM > 300,])
# Extract unique elements
unique(emp$JOB)

# Reading Data Files
# R programming language allow you to import a data set, which can be comma-separated values (CSV) file,
# Excel file, tab-separated file, JSON file, or others in order to read them into the R console or R.

# Before you look into importing data into the R console, you must determine your workplace or
# work directory first. You should always set the current workplace directory to tell R the location
# of your current project folder. This allows for easier references to data files and scripts.

# Use the getwd() function to get the current workspace location
# use the setwd() function to set the current workspace directory

# Reading a CSV file
csv_data <- read.csv("boxplot_format.csv")
csv_data

csv_data_2 <- read.csv(file ="boxplot_format.csv", header=TRUE, sep=",")
csv_data_2

# Writing a CSV file
# write.csv(data, file="csv_data_2.csv", quote=TRUE, na="na", row.names=FALSE)

# Reading an Excel file
# To read an Excel file, you need to use the xlsx package.
# The xlsx package requires a Java runtimes, so you must install it on your PC.
install.packages("xlsx")
require("xlsx")

# my_data <- read.xlsx(file="data.xlsx", 1)
library("openxlsx")
# Writing an Excel file
# write.xlsx(data, file="data2.xlsx", sheetName="sheet1",col.names=TRUE, row.names=FALSE)

# Reading an SPSS file
# install.packages("foreign")
# require(foreign)
# my_data <- read.spss(file = "data.spss", to.data.frame=TRUE)
# Writing an SPSS file
# write.foreign(df, datafile, codefile, package=c("SPSS","Stata", "SAS"),...)

# Reading a JSON file
# JSON or JavaScript Object Notation, is a very popular data interchange format that that is
# easy for humans to write or read. A JSON file can be read by using rjson package.

# Install package rjson
install.packages("rjson")

# Load the package required to read JSON files.
require(rjson)

# Use fromJSON() function to read JSON file
my_data <- fromJSON(file = "Input.json")
my_data

# Convert JSON file into a Data frame by using as.data.frame() function
df <- as.data.frame(my_data)
df

# Reading Data from TXT and CSV files: R Base functions
# The R base function read.table() is a general function that can be used to read a file in table format.
# The data will be imported as a data frame.

# Reading a file from the Internet
# It’s possible to use the functions read.delim(), read.csv() and read.table() to import files from the web.
txt_web <- read.delim("http://www.sthda.com/upload/boxplot_format.txt")
head(txt_web)

# Reading a local files
# Read a txt file, named "boxplot_format.txt"
txt_data <- read.delim("boxplot_format.txt")
txt_data


# Read tabular data into R
# read.table(file, header = FALSE, sep = "", dec = ".")

# Read "comma separated value" files (".csv")
# read.csv(file, header = TRUE, sep = ",", dec = ".", ...)
# Or use read.csv2: variant used in countries that 

# use a comma as decimal point and a semicolon as field separator.
# read.csv2(file, header = TRUE, sep = ";", dec = ",", ...)

# Read TAB delimited files
# read.delim(file, header = TRUE, sep = "\t", dec = ".", ...)
# read.delim2(file, header = TRUE, sep = "\t", dec = ",", ...)


