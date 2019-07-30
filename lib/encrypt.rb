require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/shift'

input_text = ARGV[0]
encryption_output = ARGV[1]

enigma = Enigma.new

encryptor = enigma.encrypt(File.read(input_text))

File.write(encryption_output, encryptor[:encryption])
puts "Created #{encryption_output} with the key #{encryptor[:key]}
      and date #{encryptor[:date]}"
