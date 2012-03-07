class Integer
	@@factorial_results = [1,1]

	def fact()
		#memoize the result into this array.
		@@factorial_results[self] ||= self * (self-1).fact
	end
end
