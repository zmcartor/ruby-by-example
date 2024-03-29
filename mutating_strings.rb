=begin rdoc
a purely random string is mutated until it matches the target string
=end

class Children < Array

	def select_fittest(target)
		self.inject(self[0]) do |fittest,child|
			child.fitter_than?(fittest,target) ? child : fittest
		end
	end
end

class String
	ALPHABET = ('a'..'z').to_a
	LETTER_OFFSET = 'a'.getbyte(0) #this is the numeric value of 'a'. used to determine placement in the ALPHABET array

	PARAMS = {
		:generation_size => 20,
		:mutation_rate => 10,
		:display_filter => 5,
		:mutation_map => 6
	}

	TARGET = 'iwouldreallylikeabeer'

	@mutation_attempts ||= 0

	def deviance_from(target)
		deviance = 0;
		split('').each_index do |index|
			deviance += (self.getbyte(index) - target.getbyte(index)).abs #sum up the differences
		end
		return deviance
	end

	def fitter_than?(other, target)
		self.deviance_from(target) < other.deviance_from(target)
	end

	def mutate(params)
		self.split('').map {|char| mutate_char(char, params)}.join('')
	end

	def mutate_until_matches!(target=TARGET, params=PARAMS)
		return report_success if (self == target)
		report_progress params
		@mutation_attempts += 1
		children = propagate(params)
		fittest = children.select_fittest target
		replace fittest
		mutate_until_matches! target, params
	end

	def propagate(params)
		children = Children.new
		children << self
		params[:generation_size].times do |generation| 
			children << self.mutate(params)
		end
		return children
	end

	def report_progress(params)
		return unless (@mutation_attempts % params[:display_filter] ==0 )
		puts "string ##{@mutation_attempts} = #{self} "
	end

	def report_success()
		puts "I match after #{@mutation_attempts} mutations!"
		return @mutation_attempts
	end

	#replace self with a String the same length as target. all lowercase
	
	def scramble!(target = TARGET)
		@mutation_attempts = 0
		self.replace(scramble(target))
	end

	def scramble(target = TARGET)
		target.split('').map { |char| ALPHABET[rand(ALPHABET.size)] }.join('')
	end

	private


	def limit_index(alphabet_index)
		alphabet_index = [ALPHABET.size-1, alphabet_index].min
		alphabet_index = [alphabet_index, 0].max
	end

	def mutate_char(original_char, params)
		return original_char if rand(100) > params[:mutation_rate]

		#randomizes the selection of a new character from the ALPHABET array. kinda odd.
		variance = rand(PARAMS[:mutation_map]) - (PARAMS[:mutation_map] / 2)
		variance +=1 if variance.zero?
		alphabet_index = (original_char.getbyte(0) + variance - LETTER_OFFSET)
		alphabet_index = limit_index(alphabet_index)
		mutated_char = ALPHABET[alphabet_index]
		return mutated_char
	end



end
