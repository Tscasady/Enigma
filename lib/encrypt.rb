# frozen_string_literal: true

require './lib/enigma'

input = File.open("./data/#{ARGV[0]}", 'r')
output = ARGV[1]
key = ARGV[2]
date = ARGV[3]

enigma = Enigma.new
enigma.encrypt(File.read(input), key, date)
puts "Created #{output} with the key #{key} and date #{date}"