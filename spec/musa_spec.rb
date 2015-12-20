require 'spec_helper'

describe Musa do

	ROOT = File.dirname __FILE__

	before(:all) do
		encrypted_file = File.join(ROOT, "fixtures", "encrypted_test.txt")
		decrypted_file = File.join(ROOT, "fixtures", "decrypted_test.txt")

		File.unlink encrypted_file if File.exists?(encrypted_file)
		File.unlink decrypted_file if File.exists?(decrypted_file)
	end

	context 'has a version number' do
		it { expect(Musa::VERSION).not_to be nil }
	end

	context 'has a cipher algorithm' do
		it { expect(Musa::ALGORITHM).to eq("AES-256-CBC") }
	end

	context 'throws a error on encrypt' do
		it 'when key is too short' do
			expect { Musa::Encryption.encrypt "", "" }.to raise_error(Musa::Error::ShortKey)
		end
	end

	context 'throws a error on decrypt' do
		it 'when key is too short' do
			expect { Musa::Decryption.decrypt "", "" }.to raise_error(Musa::Error::ShortKey)
		end
	end

	context 'throws a error on encrypt file' do
		it 'when file is not found' do
			expect { Musa::Encryption.encrypt_file "", File.join(ROOT, "fixtures", "notfound.txt"), "" }.to raise_error(Musa::Error::FileNotFound)
		end
		it 'when key is too short' do
			expect { Musa::Encryption.encrypt_file "", File.join(ROOT, "fixtures", "test.txt"), "" }.to raise_error(Musa::Error::ShortKey)
		end
	end

	context 'throws a error on decrypt file' do
		it 'when file is not found' do
			expect { Musa::Decryption.decrypt_file "", File.join(ROOT, "fixtures", "encrypted_notfound.txt"), "" }.to raise_error(Musa::Error::FileNotFound)
		end
		it 'when key is too short' do
			expect { Musa::Decryption.decrypt_file "", File.join(ROOT, "fixtures", "test.txt"), "" }.to raise_error(Musa::Error::ShortKey)
		end
	end

	context 'when is valid' do
		#Fixtures
		key = Faker::Lorem.characters 32
		data = Faker::Lorem.paragraph
		encrypted_data = ''

		it 'encrypt a string' do
			encrypted_data = Musa::Encryption.encrypt key, data

			expect(encrypted_data).not_to be nil
			expect(encrypted_data).to be_a String
			expect(encrypted_data.size).to be > 0
		end

		it 'decrypt a string' do
			decrypted_data = Musa::Decryption.decrypt key, encrypted_data

			expect(decrypted_data).not_to be nil
			expect(decrypted_data).to be_a String
			expect(decrypted_data.size).to be > 0
			expect(decrypted_data).to eq(data)
		end

		it 'encrypt a file' do
			#Fixtures
			file_path = File.join(ROOT, "fixtures", "test.txt")
			file_output = File.join(ROOT, "fixtures", "encrypted_test.txt")
			encrypted_data = Musa::Encryption.encrypt_file key, file_path, file_output

			expect(File.exists?(file_output))
			expect(File.read(file_output)).to eq(encrypted_data)
		end

		it 'decrypt a file' do
			#Fixtures
			encrypted_path = File.join(ROOT, "fixtures", "encrypted_test.txt")
			file_output = File.join(ROOT, "fixtures", "decrypted_test.txt")
			decrypted_data = Musa::Decryption.decrypt_file key, encrypted_path, file_output

			expect(File.exists?(file_output))
			expect(File.read(file_output)).to eq(decrypted_data)
		end
	end
end
