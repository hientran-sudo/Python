###
#
# Problem 6.1
#
# Write a multiplication script using either a for loop or a while loop.
#
###

# Initialize variables
value_1 = 5
value_2 = 4
total = 0
i = 0

# Run for loop
for(i in 1:value_2){
  total = total + value_1
}
print(total)

# Reinitialize variables needed to run while loop
total = 0
i = 0

# Run while loop
while (i < value_2) {
  total = total + value_1
  i = i + 1
}
print(total)