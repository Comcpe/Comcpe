

require '../raknet/packet/packet'
require '../raknet/packet_handler'
require '../raknet/packet/unconnected_ping'
require '../raknet/packet/unconnected_pong'

class SessionManager

  def initialize(main, network)
    @main = main
    @network = network
    PacketHandler::register(self)
  end

  def receivePacket(buffer, source)

    if(!buffer.nil?)
      @main.getLogger().debug("#{UNCONNECTED_PING.getId}, #{buffer[0].ord}")

      if buffer[0].ord.equal?(UNCONNECTED_PING.getId)
      end
      return true
    end

    return false
  end

  def sendPacket(packet, source)
    @network.sendPacket(packet, source)
  end
end