module Musa
	module Error
		class Error < StandardError
			def initialize(msg=nil)
				@message = msg
			end

			def message
				@message
			end
		end

		class FileNotFound < Error
			def message
				"Cannot find the file path."
			end
		end

		class ShortKey < Error
			def message
				"Key need to have length greater than or equal to 32."
			end
		end
	end
end
