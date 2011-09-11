class Integer
	#base conversion hashy
	
	ARABIC_TO_ROMAN = {
		1000 : 'M' ,
		500 : 'D',
		100 : 'C',
		50 : 'L',
		10: 'X' ,
		5 : 'V' ,
		1 : 'I',
		0 : ''
	}

	SUBTRACTIVE_ROMAN = {
		900 : 'CM' ,
		400 : 'CD' ,
		90 : 'XC' ,
		40 : 'XL' ,
		9 : 'IX' ,
		4 : 'IV'
	}

	#use the subtractive hash?
	SUBTRACTIVE = true

	def to_roman()
		@@roman_of ||= create_roman_of()
		return '' unless (self > 0)
		return self.to_s if self > maximum_representable()

	end
end
