module Uniden
  module Api
  
    class Scanner 

      ERROR_RESULTS = ['NG', 'ORER', 'FER', 'ERR', '']

      attr_accessor :serial_port

      def initialize(serial_port)
        @serial_port = serial_port
      end

      def start_programming
        send_read('PRG')
      end

      def stop_programming
        send_read('EPG')
      end

      def systems
        systems       = []
        system_index  = send_read('SIH')
        while system_index.to_i != -1 do 
          data          = send_read("SIN, #{system_index}")
          data.unshift(system_index)
          system  = System.new(self, data)
          systems << system
          system_index = system.fwd_index
        end
        systems
      end

      def scan
        send_read('KEY,S,P')
      end

      def send_read(cmd)
        send_command(cmd)
        return read
      end

      def send_command(cmd)
        @serial_port.write "#{cmd}\r"
      end

      def read
        res = @serial_port.readline("\r").chomp.split(',')
        return false if ERROR_RESULTS.include?(res[0].upcase)
        res = res.drop(1)
        res.size == 1 ? res[0] : res
      end

    end
  
  end
end