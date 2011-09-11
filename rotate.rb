class String

	def rotate(char)
		return nil unless self.match(char)
		return self if (self[0] == char[0])
		#FYI, every string has a 'chars' property. (it's an enumerator, not array.)

		#This turns 'self' into an array so we can pop it.
		chars = self.split(//)
		return ([chars.pop] + chars).join('').rotate(char)
	end

	def rotate!(char)
		replace(rotate(char))
	end

end
