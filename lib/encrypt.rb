# frozen_string_literal: true

require './lib/enigma'

input = File.open("./data/#{ARGV[0]}", 'r')
output = File.open("./data/#{ARGV[1]}", 'w')

enigma = Enigma.new
encrypted = enigma.encrypt(File.read(input))
output.write("#{encrypted[:encryption]}")
puts "Created #{ARGV[1]} with the key #{encrypted[:key]} and date #{encrypted[:date]}"