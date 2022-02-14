# Question 1
# Output calculation
answer = ((2 * 7) + 12)^2
print(answer)

# Question 2 
# Use the if-else structure to check if the value from the last question is divisible by 3.
# If the number is divisible by 3, check if the same number is divisible by 4.  
# If the number is not divisible by either 3 or 4 print the immediate larger number that is divisible by both 3 and 4
while(1 == 1){
  if((answer %% 3 == 0) & (answer %% 4 == 0)){
    break;
  } else {
    answer = answer + 1;
  }
}
print(answer)

