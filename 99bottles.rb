#! /usr/bin/env ruby

#99 bottles of beer song fun!

class Wall
	def initialize(number_of_bottles)
		@bottles = number_of_bottles
	end

=begin rdoc
this is some super fun rdoc stuff wwowo!
=end

def empty?()
	@bottles.zero?
end

=begin
this will decrement the number of beers!
=end
def sing_one_verse!()
	wall = " on the wall "
	p sing() + wall + sing() +", \n"+take_one_down!+ sing() + wall
end

def sing()
	#using #{ } processing and ternary operator to format a string. super cool!!
	"#{ (@bottles >0) ? @bottles : 'no more' } #{ (@bottles ==1)? 'bottle' : 'bottles'} of beer"
end

def take_one_down!()
	@bottles-=1
	' take one down, passss it arounnnd '
end
end #end the class
