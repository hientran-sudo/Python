# Use a "for loop" to print all the years that are leap years between 2008 and 2020
for (year in 2008:2020){
  if (year%%4==0){
    if (year%%100==0){
      if (year%%400==0) 
        print(paste(year,"is a leap year"))
    } else
      print(paste(year,"is a leap year"))
  }
}

# Use a "while loop" to calculate the number of characters in the following line:
# "Today is a good day."
# print(length("Today is a good day.")) does not give you the answer
count = 0
arrStr <- strsplit("Today is a good day.", "")[[1]]
while(count < length(arrStr))
  count = count + 1
print(count)


