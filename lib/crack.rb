require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/cracker'

enigma = Enigma.new

cracker = enigma.crack(File.read(ARGV[0]), ARGV[2].to_s)

File.write(ARGV[1], cracker[:decryption])
puts "Created #{ARGV[1]} with the cracked key #{cracker[:key]}
      and date #{cracker[:date]}"
