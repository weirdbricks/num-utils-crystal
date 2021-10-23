##############################################
# Takes numbers through STDIN and gives you an
# average, just like `numaverage` from num-utils
##############################################

##############################################
# Starting values
##############################################
sum=0
input = STDIN.gets_to_end
item_integer = 0
item_float   = 0.0
is_integer=false

# Check if we have any newlines
if input.includes?("\n") 
  array_of_strings = input.split("\n")
else
  abort "no new lines detected - cannot add anything."
end

# If any of the array's items are empty, delete them
# from the array
array_of_strings.delete("")
count=array_of_strings.size

# Go through the array of strings and try to convert
# the items to integers
array_of_strings.each do |item|
  # first try to convert to an integer
  begin
    item_integer = item.to_i
    sum=sum+item_integer
    is_integer=true
  rescue
    is_integer=false
  end

  # if the integer conversion failed, let's see if we can convert to a float
  if is_integer == false
    # then try converting to a float
    # if that fails, set number to 0
    begin
      item_float = item.to_f
      sum=sum+item_float
    rescue
      puts "\"#{item}\" is not a float - Treating as 0"
      sum=sum+0
    end
  end
end

# finally print out the sum divided by the number of items in the array
puts sum/count
