class Integer
	def fact()
		return 1 if (self.zero?) or (self ==1)
		return self * (self-1).fact
	end
end
