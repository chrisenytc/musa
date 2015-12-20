require "openssl"
require "base64"

module Musa
	class Encryption
		def self.encrypt(key, data)
			# Raise a error if key length is less than 32
			raise Musa::Error::ShortKey if key.size < 32
			# Generate cipher
			cipher = OpenSSL::Cipher.new ALGORITHM
			# Start encryption
			cipher.encrypt
			# Add cipher key
			cipher.key = key
			# Add data to the cipher
			crypt = cipher.update(data) + cipher.final
			# Encode cipher result
			Base64.encode64 crypt
		end

		def self.encrypt_file(key, file_path, file_output)
			# Raise a error if file is not found
			raise Musa::Error::FileNotFound if not File.exists?(file_path)
			# Read source
			file = File.read file_path
			# Encrypt source
			encrypted_data = self.encrypt key, file
			# Write encrypted data to output file
			File.open(file_output, "a+") do |file|
				file << encrypted_data
			end
			# Return encrypted data
			encrypted_data
		end
	end
end
