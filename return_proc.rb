#return proc
#
#create a function which returns other proc objects

=begin rdoc
criterion argument selects a lambda from the internal hash of procs
other_criterian used within the lambda for testing
=end

def return_proc(criterion, other_criterion =1)

	proc_of_criterion = {
		'div_by?'=> -> i {i if (i % other_criterion).zero?},
		'is?' => -> i {i if i == other_criterion}
	}

	#if the test is for divisible by 2, allow 'is_even' as shortcut
	return return_proc('div_by?' , 2) if criterion == 'is_even'

	#make up my own silly shortcut
	return return_proc('div_by?' , 3) if criterion == 'is_three_legged_stool'

	proc_to_return = proc_of_criterion[criterion]
	fail "dunno what to do with that" unless proc_to_return
	return proc_to_return
end


#call the procs directly

even_proc = return_proc('div_by?', 2)
div3_proc = return_proc('is_three_legged_stool')
is10 = return_proc('is?' , 10)


#notice the special . syntax for calling a proc
(1..30).each do |num|
	puts %Q[ Is #{num} even? : #{even_proc.(num)? 'Yep':'nope'}]
	puts %Q[ Is #{num} three legged stool? : #{div3_proc.(num)? 'Sit down!' : 'no stool'}]
end

#using proc as a block for a method
#pass using the pretzel operator &

digits = (1..30).to_a
evens = digits.find_all(&even_proc)
stools = digits.find_all(&div3_proc)


