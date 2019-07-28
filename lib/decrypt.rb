require './lib/enigma'
require './lib/key'
require './lib/offset'
require './lib/shift'

enigma = Enigma.new
decryptor = enigma.decrypt(File.read(ARGV[0]), ARGV[2].to_s, ARGV[3].to_s)
File.write(ARGV[1], decryptor[:decryption])
puts "Created #{ARGV[1]} with the key #{decryptor[:key]}
      and date #{decryptor[:date]}"
