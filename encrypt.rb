require 'openssl'
require 'digest/sha2'
require 'base64'

#set up message to be encrypted
message = "HELLO"
cipher = OpenSSL::Cipher.new('aes-128-cbc')

aes_key = Digest::MD5.hexdigest("12345678901234567890123456789012")
aes_iv = "000102030405060708090a0b0c0d0e0f"

cipher.encrypt
cipher.key = [aes_key].pack('H*')
cipher.iv = [aes_iv].pack('H*')

encrypted = cipher.update(message) << cipher.final()

puts "AES Key : #{aes_key}"
puts "AES IV : #{aes_iv}"
puts encrypted.unpack('H*')
