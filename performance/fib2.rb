class Integer
	@@fib_results = [1,1]

	def fib()
		#memoize the results
		@@fib_results[self] ||= (self-1).fib + (self-2).fib
	end
end
