require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/shift'

encrypted_text = ARGV[0]
decryption_output = ARGV[1]
user_key = ARGV[2].to_s
user_date = ARGV[3].to_s

enigma = Enigma.new

decryptor = enigma.decrypt(File.read(encrypted_text), user_key, user_date)

File.write(decryption_output, decryptor[:decryption])

puts "Created #{decryption_output} with the key #{decryptor[:key]}
      and date #{decryptor[:date]}"
