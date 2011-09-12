class Integer
	#base conversion hashy
	
	ARABIC_TO_ROMAN = {
		1000 => 'M' ,
		500=> 'D',
		100=> 'C',
		50=> 'L',
		10=> 'X' ,
		5=> 'V' ,
		1=> 'I',
		0=> ''
	}

	SUBTRACTIVE_ROMAN = {
		900=> 'CM' ,
		400=> 'CD' ,
		90=> 'XC' ,
		40=> 'XL' ,
		9=> 'IX' ,
		4=> 'IV'
	}

	#use the subtractive hash?
	SUBTRACTIVE = true

	def to_roman()
		@@roman_of ||= create_roman_of()
		return '' unless (self > 0)
		return self.to_s if self > maximum_representable()
		#find the largest base that is less than the integer
		base = @@roman_of.keys.sort.reverse.detect{ |k| k <= self}
		return '' unless (base and base > 0)
		#first calculation determines how 
		return (@@roman_of[base] * number_base_repeat(base)) + (self % base).to_roman()
	end

=begin rdoc 
Use the class constants to build the Hash to appropriate roman numeral values
=end

def create_roman_of()
	return ARABIC_TO_ROMAN unless SUBTRACTIVE
	return ARABIC_TO_ROMAN.merge(SUBTRACTIVE_ROMAN)
end

=begin
determing the largest number this function can reasonably represent
=end

def maximum_representable()
	(@@roman_of.keys.max * 5) -1
end

=begin rdoc
Find how many times we need the base.
ex: 2000 = MM (M being 1000)
=end

def number_base_repeat(base)
	(self- (self % base)) / base
end

end
