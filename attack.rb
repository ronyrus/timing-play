#!/usr/bin/env ruby

require 'Open3'
require 'set'

tgt_in, tgt_out = Open3.popen3 './target'

def time_one_guess(guess, i, o)

  deltas = []
  100.times do 
    t0 = Time.now
    i.puts "#{guess}\n"
    line = o.readline()
    deltas << Time.now - t0
  end

  sum = deltas.inject(0) {|d, s| s += d}
  return sum / 100
end

abc = Set.new
abc.merge('a'..'z').merge('A'..'Z').merge('0'..'9')

report = {}

Open3.popen3 './target' do |i, o|

  abc.each do |c|
    o.readline() # read the enter password prompt

    guess = "#{c}xxx"
    time, output = time_one_guess(guess, i, o)

    report[c] = time
    puts("%c %.9f" % [c, time])
  end
end


    # puts output
