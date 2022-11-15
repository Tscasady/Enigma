# frozen_string_literal: true

require './lib/enigma'

input = File.open("./data/#{ARGV[0]}", 'r')
output = File.open("./data/#{ARGV[1]}", 'w')
key = ARGV[2]
date = ARGV[3]

enigma = Enigma.new
encrypted = enigma.encrypt(File.read(input), key, date)
output.write("#{encrypted[:encryption]}")
puts "Created #{ARGV[1]} with the key #{encrypted[:key]} and date #{encrypted[:date]}"