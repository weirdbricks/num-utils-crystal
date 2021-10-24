##############################################
# Takes numbers through STDIN and finds the 
# smallest or greatest, just like numbound
# from num-tools
##############################################

begin
  if ARGV[0] == "-h" || ARGV[0] == "--help" || ARGV[0] == "help"
    abort "some help stuff"
  end

  if ARGV[0] != "-h" && ARGV[0] != "-l"
    abort "some help stuff - incorrect switch"
  end
rescue
end

##############################################
# Starting values
##############################################
max_bound=0
low_bound=9223372036854775807
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

# Go through the array of strings and try to convert
# the items to integers
array_of_strings.each do |item|
  # first try to convert to an integer
  begin
    item_integer = item.to_i
    if item_integer > max_bound
      max_bound = item_integer
    end
    if item_integer < low_bound
      low_bound = item_integer
    end
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
      if item_float > max_bound
        max_bound = item_float
      end
      if item_float < low_bound
        low_bound = item_float
      end
    rescue
      puts "\"#{item}\" is not a float - Treating as 0"
    end
  end
end

# finally print out the bounds
begin
  if ARGV[0] == "-l"
    puts low_bound
  end
rescue
  puts max_bound
end
