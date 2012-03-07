=begin comment
be sure to run without warnings. ruby -w
=end

require 'benchmark'

include Benchmark

FUNC_OF_FILE = { 'fac' => 'fact',
	'fib' => 'fib'
}

UPPER_OF_FILE = {
	'fac' => 2000,
	'fib' =>30
}

['fac' , 'fib'].each do |file|
	(1..2).to_a.each do |num|
		require "./#{file}#{num}"
		upper = UPPER_OF_FILE[file]

		bm do |test|
			test.report("#{file}#{num}") do
			upper.send(FUNC_OF_FILE[file])
			end
		end

	end
end
