=begin rdoc
extend built-in Array class and add a 'matching members' function
=end

class Array

=begin rdoc
Takes a Proc argument and returns all members of the array matching the criteria defined by that Proc
=end

#parameterizing the 'find_all' function of Array
def matching_members(proggy)
	self.find_all {|i| proggy.call(i)}
end
end

digits = (0..9).to_a

func_hash = Hash.new()
func_hash['five+'] = lambda {|term| term >= 5}
func_hash['is_even'] = lambda {|term| (term % 2) == 0}

#run each number within our digits range through these functions and return numbers which return 'true'
func_hash.keys.sort.each do |func|
	lambda_proc = func_hash[func]
	lambda_value = digits.matching_members(lambda_proc).join(',')
	puts "#{func} \t [#{lambda_value}]\n"
end
