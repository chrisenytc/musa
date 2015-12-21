require 'openssl'
require 'base64'

module Musa
  ##
  # Musa encryption class
  class Encryption
    def self.encrypt(key, data)
      # Raise a error if key length is less than 32
      fail Musa::Error::ShortKey if key.size < 32
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
      fail Musa::Error::FileNotFound unless File.exist?(file_path)
      # Read source
      file = File.read file_path
      # Encrypt source
      encrypted_data = Musa::Encryption.encrypt key, file
      # Write encrypted data to output file
      File.open(file_output, 'a+') do |f|
        f << encrypted_data
      end
      # Return encrypted data
      encrypted_data
    end
  end
end
