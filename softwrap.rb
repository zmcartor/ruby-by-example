=begin rdoc
preserves \n\n between paragraphs but compresses "\n" and other whitespace within each paragrah
into a single space

=end

def softwrap(filename)
	File.open(filename , 'r').readlines.inject('') do |output,line|
		output += softwrap_line(line)
	end.gsub(/\t+/,' ').gsub(/ +/,' ')
end #end softwrap

=begin rdoc
return \n\n if the String arg has no length after being chomped (signifying it was a blank line separating paragraphs)
otherwise return chomped line with trailing space for padding
=end

def softwrap(line)
	return "\n\n" if line == "\n"
	return line.chomp + ' '
end

puts softwrap(ARGV[0])
