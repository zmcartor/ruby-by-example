
class Array
=begin rdoc
takes a block as argument and returns a list of members matching
the test provided by the block. Could just use Array#find_all , but this is fun too.
=end

def matching_members(&block)
	self.find_all &block
end

=begin rdoc 
takes an array of procs and converts them to block using &

=end

def matching_compound_members(procs_arr)
	procs_arr.map do |a_proc|
		matching_members &a_proc
	end.inject(self) do |memo, matches|
		#find all intersections starting with self
		#go down until we have all members matching every proc
		memo & matches
		#the next argument to inject will be result of this statement.
	end
end

end

#now for the fun, using these with some procs

digits = (0..100).to_a
lambs = Hash.new()
lambs['five'] = ->  i { i if i >5}
lambs['is_even'] = -> i { i if (i%2).zero?}
lambs['div_by3'] = ->  i {i if (i%3).zero?}

lambs.keys.sort.each do |name|
	lamb_proc = lambs[name]
	matching_values = digits.matching_members(&lamb_proc).join(',')
	puts "#{name}\t [#{matching_values}]\n"
end

#pass all of the lambda hashes values to our compound matching members func
#returns set of values that match ALL the lambda functions
puts "ALL \t [#{digits.matching_compound_members(lambs.values).join(',')}]"
