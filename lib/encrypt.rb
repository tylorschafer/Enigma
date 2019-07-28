require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/shift'

enigma = Enigma.new
encryptor = enigma.encrypt(File.read(ARGV[0]), ARGV[2].to_s, ARGV[3].to_s)
File.write(ARGV[1], encryptor[:encryption])
puts "Created #{ARGV[1]} with the key #{encryptor[:key]}
      and date #{encryptor[:date]}"
