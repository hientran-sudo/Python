# Function that returns smallest of two given numbers

smallest = function(x, y) {
  if (x>y) {
    return(y)
  }
  else{
    return(x)
  }
}

# Calling the function
min <- smallest(2,-9)
min
