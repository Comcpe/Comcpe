
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
    server = UDPSocket.open

    begin
      server.bind('0.0.0.0', 19132)
    rescue
      @main.getLogger.critical('FAILED TO BIND TO 19132')
      @main.getLogger.critical('shutdown the server...')
      @main.killComcpe
    end

    @thread = Thread.new do

      while @main.isRunning
        data = server.recvfrom(1024*1024*8)
        @main.handlePacket(data[1][2], data[1][1], data[0].unpack('h*')[0])
      end

      server.shutdown

    end

  end

  def kill
    if !@thread.nil?
      @thread.kill
    end

  end

end