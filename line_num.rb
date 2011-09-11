def get_lines(filename)
	return File.open(filename, 'r').readlines
end

def get_format(lines)
	#depending on how many element there are in the readlines array, we output 01, 001 or 0001 to keep everything lined up.
	#take the size of lines, convert to string, then number of chars. so ten would be 2, 100 is 3, etc
	return "%0#{lines.size.to_s.size}d"
end

def get_output(lines)
	format = get_format(lines)
	output = ''

	lines.each_with_index do |line , i|
		output += "#{sprintf(format, i+1)}: #{line}" #add 1 to index since there's no line 0
	end
	return output
end
print get_output(get_lines(ARGV[0]))
