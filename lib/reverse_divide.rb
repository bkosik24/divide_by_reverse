require "pp"
class ReverseDivide

	def initialize(limit = 1000000)
		@limit = limit
	end

	def find_all_numbers
		return "The limit can only be an integer." unless @limit.is_a?(Integer)
		@valid_numbers, final_numbers = [], []
		# first remove all the values that are invalid for this application
		@limit.downto(1).each{|num| check_if_number_is_valid(num)}
		# after removing the invalid numbers, we need to loop through all them
		@valid_numbers.each do |number|
			reverse_of_number = number.to_s.reverse.to_i
			# if the reverse of the number is greater than the number itself, then we can automatically omit that number.
			next if reverse_of_number > number
			# since we only really care if the remainder is 0 so we'll use modulus instead of dividing
			divide_result = (number % reverse_of_number)
			# insert only the numbers that, when divided, returns an integer.
			final_numbers << number if divide_result == 0
		end
		pp "#{final_numbers.size} numbers are divisible by the reverse. They are: #{final_numbers.join(', ').chomp}"
	end

	def check_if_number_is_valid(number)
		# don't check palindromes or any number that ends in 0
		unless (number.to_s.reverse == number.to_s) || (number.to_s[-1] == "0")
			@valid_numbers << number
		end
	end

end