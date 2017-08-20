
=begin
 NetworkThread
 PacketHandler
=end

require 'socket'

class NetworkThread

  public # @param [Comcpe] main
      def initialize (main)
    @main = main
  end

  public def execute
    @thread = Thread.new do
      server = UDPSocket.new
      @main.getLogger.info('hey')
      # sockaddr = Socket.sockaddr_in(19132, "0.0.0.0")
      p server.bind('0.0.0.0', 19132)

      @main.getLogger.info('hey')

      while @main.isRunning
        @main.getLogger.debug(server.recvfrom(1024*1024*8))
        print "end!\n"
      end
    end
  end
end