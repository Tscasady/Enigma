# frozen_string_literal: true

require './lib/enigma'

input = File.open("./data/#{ARGV[0]}", 'r')
output = File.open("./data/#{ARGV[1]}", 'w')
key = ARGV[2] if !(ARGV[2].nil?)
date = ARGV[3] if !(ARGV[3].nil?)

enigma = Enigma.new
decrypted = enigma.decrypt(File.read(input), key, date)
output.write("#{decrypted[:decryption]}")
puts "Created #{ARGV[1]} with the key #{decrypted[:key]} and date #{decrypted[:date]}"
