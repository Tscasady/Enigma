# frozen_string_literal: true

require './lib/enigma'

puts ARGV
input = File.open("./data/#{ARGV[0]}", 'r')
output = File.open("./data/#{ARGV[1]}", 'w')
key = ARGV[2] if !(ARGV[2].nil?)
date = ARGV[3] if !(ARGV[3].nil?)

enigma = Enigma.new
enigma.encrypt(File.read(input))
puts "Created #{output} with the key #{key} and date #{date}"