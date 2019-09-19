# When done, submit this entire file to the autograder.

#------------------------------------------------Part 1--------------------------------------------------------------------------------------------

def sum  array
  # YOUR CODE HERE
	ans = 0 
	#find the sum through iteration
	for x in array do
		ans = ans + x
	end
	return ans
end

def max_2_sum array
  # YOUR CODE HERE
  # return 0 for length = 0
	if array.length == 0
		return 0
	end
	# selecting greater value in array
	max_element_1 = array.max
	# return the element if lenth of array is 1
	if array.length == 1
		return max_element_1
	end
	
	# array sort and take two elements at last positions
	sorted_array = array.sort!
	max2_array = sorted_array.last(2)
	return max2_array[0] + max2_array[1] # return the sum of two max elements
end

def sum_to_n? array, n
  # YOUR CODE HERE

	for i in array do
		#dup array creation and find if sum of 2 numbers in that array is n
		dup_array = []
		dup_array.replace(array)
		# delete an element
		dup_array.delete_at(dup_array.index(i))
		if dup_array.include?(n-i)
			return true 
		end
	end
	return false
end

#------------------------------------------------Part 2--------------------------------------------------------------------------------------------

def hello(name)
  # YOUR CODE HERE
  str = "Hello, "
	return str + name
end

def starts_with_consonant? str
  # YOUR CODE HERE
	if str.length == 0
		return false
	end
	#VOWEL string is created
	l = "AEIOUHaeiouh"
	compare_string = l.split('')
	x = str[0]
	compare_string.each { |compare_x|
		if x == compare_x
			return false
		end
		
		if (x < 'A' or x > 'Z') and !(x > 'a' and x < 'z')
			return false
		end
		if (x <'a' or x > 'z') and !(x > 'A' and x < 'Z')
			return false
		end
	}
	return true 
end

def binary_multiple_of_4? str
  # YOUR CODE HERE
	if str.length == 0
		return false
	end
	array_str = str.split('')
	# b is binary bit, checking if the number is binary or not
	array_str.each { |b|
		if (b != '0'  and b != '1')
			return false
		end
	}
	# checking whether it is multiple of 4
	if (array_str[-1] == '1' or array_str[-2] == '1')
		return false
	end
	return true
end

#------------------------------------------------Part 3--------------------------------------------------------------------------------------------
class BookInStock
# YOUR CODE HERE
 #defining getters and setters
	attr_reader :isbn, :price
	attr_writer :isbn, :price

	def initialize(isbn_input, price_input)
	
	@price = price_input # intitializing inputs
	@isbn = isbn_input

	if @price <= 0
		raise ArgumentError.new('non positive number') # any errors
	end
	
	if @isbn.length == 0 
		raise ArgumentError.new('Received String is empty') #any errors
	end
	end
	
	def price_as_string
		str_price = @price.to_s
		cnt = 0
		ans = '$' 
		f = 0
		str_price.split('').each { |l|
			# count is 2 if it is parsed over two decimal digits
			if cnt == 2 
				return 0
			end
			if f == 1
				cnt = cnt + 1	
			end
			
			if l == '.'
				f = 1
			end
			
			ans = ans + l
		}		
		# No decimal with "."then add ".00" at the end
		if cnt == 0
			ans = ans + '.'
		end
		for var in cnt...2
			ans =ans + '0'
		end
		return  ans # returns the final required string
	end
end