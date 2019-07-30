require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/shift'
require './lib/cracker'

encrypted_text = ARGV[0]
decryption_output = ARGV[1]
user_date = ARGV[2].to_s

enigma = Enigma.new

cracker = enigma.crack(File.read(encrypted_text), user_date)

File.write(decryption_output, cracker[:decryption])

puts "Created #{decryption_output} with the cracked key #{cracker[:key]}
      and date #{cracker[:date]}"
