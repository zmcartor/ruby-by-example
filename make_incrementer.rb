def make_incrementer(delta)
	#return a 'proc' object. use .call(x) to execute.
	return lambda {|x| x + delta}
end

incrementer_proc_of = Hash.new()

[10,20].each do |delta|
	incrementer_proc_of[delta] = make_incrementer(delta) #each number is hashed with a callback function.
	#these procs are called 
end

#go through hash, iterating by 'each key/value pair'
incrementer_proc_of.each_pair do |delta , in_proc|
	puts "#{delta} + 5 = #{in_proc.call(5)} \n"
end

#call even more incrementing!
incrementer_proc_of.each_pair do |delta, in_proc|
	#for each term in the range, converted to array
	(0..5).to_a.each do |term|
		puts "#{delta} + #{term} = #{in_proc.call(term)} \n"
	end
end
