require "openssl"
require "base64"

module Musa
	class Decryption
		def self.decrypt(key, encrypted_data)
			# Check length
			raise Musa::Error::ShortKey if key.size < 32
			# Generate cipher
			cipher = OpenSSL::Cipher.new ALGORITHM
			# Start decryption
			cipher.decrypt
			# Add cipher key
			cipher.key = key
			# Define temporary data
			tempdata = Base64.decode64 encrypted_data
			# Add encrypted data to cipher
			crypt = cipher.update tempdata
			# Finish decryption
			crypt << cipher.final
		end

		def self.decrypt_file(key, encrypted_path, file_output)
			# Raise a error if file is not found
			raise Musa::Error::FileNotFound if not File.exists?(encrypted_path)
			# Read encrypted source
			file = File.read encrypted_path
			# Decrypt encrypted source
			decrypted_data = self.decrypt key, file
			# Write decrypted data to output file
			File.open(file_output, "a+") do |file|
				file << decrypted_data
			end
			# Return decrypted data
			decrypted_data
		end
	end
end
