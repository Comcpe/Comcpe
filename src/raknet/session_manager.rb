

require '../raknet/packet/unconnected_ping'
require '../raknet/packet/unconnected_pong'
require '../raknet/packet/packet'

class SessionManager

  def initialize(main, network)
    @main = main
    @network = network
  end

  def receivePacket(buffer, source)

    if(!buffer.nil?)
      @main.getLogger().debug("#{UNCONNECTED_PING.getId}, #{buffer[0].ord}")
      if buffer[0].ord.equal?(UNCONNECTED_PING.getId)
        @main.getLogger.debug('UNCONNECTED_PING!')
        packet = UNCONNECTED_PING.new
        packet.setBuffer(buffer)
        packet.decode

        @main.getLogger.debug(packet.pingID)



        pk = UNCONNECTED_PONG.new
        pk.pingID = 0
        pk.pingID = (packet.pingID)

        pk.encode

        sendPacket(pk, source)
      end
      return true
    end

    return false
  end

  def sendPacket(packet, source)
    @network.sendPacket(packet, source)
  end
end