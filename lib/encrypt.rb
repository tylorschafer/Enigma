require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/shift'

enigma = Enigma.new
user_created = enigma.encrypt(File.read(ARGV[0]))
File.write(ARGV[1], user_created)
puts "Created #{ARGV[0]} with the key #{user_created[:key]} and date #{user_created[:date]}"
