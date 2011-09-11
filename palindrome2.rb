
=begin rdoc
Gives every string the ability to detect if it's a palindrome
this ignores all non-alphanumeric chars
=end

class String
	DUAL_CASE_ALPHABET = ('a'..'z').to_a + ('A'..'Z').to_a

=begin rdoc
main method. takes one optional boolean which indicates whether case matters here
=end

def palindrome?(case_matters=false)
	letters_only(case_matters) == letters_only(case_matters).reverse
end

private
def letters_only(case_matters=false)
	just_letters = self.split('').find_all do |char|
		DUAL_CASE_ALPHABET.include?(char)
	end.join('') #a block is an object and you can do things with it's return value, cool!
	
	return just_letters if case_matters
	return just_letters.downcase
end


end
