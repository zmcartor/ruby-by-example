class Array
	def my_join(sep1= ', ' , sep2 =' and')
		last = self.pop
		join(sep1) + sep2 + last.to_s
		#we pop off the last array, and then do a normal join. then stick on the last sep and item at the end. cool!
	end
end
