module Musa
  module Error
    ##
    # Musa error class
    class Error < StandardError
      def initialize(msg = nil)
        @message = msg
      end

      attr_reader :message
    end

    ##
    # Musa efile not found class
    class FileNotFound < Error
      def message
        'Cannot find the file path.'
      end
    end

    ##
    # Musa short key class
    class ShortKey < Error
      def message
        'Key need to have length greater than or equal to 32.'
      end
    end
  end
end
