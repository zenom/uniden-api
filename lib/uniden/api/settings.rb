module Uniden
  module Api
  
    class Settings < Scanner
      def version
        send_read('VER')[0]
      end

      def model 
        send_read('MDL')[0]
      end
    end
  
  end
end