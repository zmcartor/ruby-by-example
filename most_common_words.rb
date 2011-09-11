
class Array

	#you could just use Array#count here as well. silly.
	def count_of(item)
		self.grep(item).size
	end

end

def most_common_words(input, limit=25)
	freq = Hash.new()
	sample = input.downcase.split(/\W/) #split by word
	sample.uniq.each do |word|
		freq[word] = sample.count_of(word) unless word ==''
	end

	#sort the words within freq hash
	#sort_by will sort the array through a given block. Could do something like:
	#[apple , pear , superlongname].sort_by{|x| x.length} would do [pear, apple, superlongname]
	words = freq.keys.sort_by do |word|
		freq[word] #we sort by how many times word appears.
	end
	#you can run this on the end.block, but this is much clearer.	
	words = words.reverse.map do |word| 
		#map will return an array with the result of the block applied. 
		#.each runs block on each element, but still returns original enumerable.
		"#{word} #{freq[word]}"
	end

	#return this slice of the array , cool!!
	return words[0, limit]
end

#since returns as array, output each item with a newline
puts most_common_words(readlines.to_s).join("\n")
