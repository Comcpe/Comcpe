
=begin
 NetworkThread
 PacketHandler
=end

require 'socket'
require '../raknet/session_manager'
class NetworkThread


  def initialize (main)
    @main = main
    @sessionManager = SessionManager.new(main, self)
  end

  def execute
    @server = UDPSocket.open

    begin
      @server.bind('0.0.0.0', 19132)
    rescue
      @main.getLogger.critical('FAILED TO BIND TO 19132')
      @main.getLogger.critical('shutdown the server...')
      @main.killComcpe
    end

    @thread = Thread.new do

      while @main.isRunning
        data = @server.recvfrom(1024*1024*8)
        @main.getLogger.info(data)
        @sessionManager.receivePacket(data[0], data[1])

      end

      @server.shutdown

    end

  end

  def sendPacket(packet, source)
    Thread.new do
      @server.send((packet.buffer), 0, source[2], source[1])
    end
  end

  def kill
    if !@thread.nil?
      @thread.kill
    end

  end

end