
require '../raknet/packet/unconnected_ping'
require '../raknet/packet/unconnected_pong'

class PacketHandler

  def self.register(sessionManager)
    @@sessionManager = sessionManager
  end

  def self.unconnectedPing(buffer, source)

    packet = UNCONNECTED_PING.new
    packet.setBuffer(buffer)
    packet.decode

    pk = UNCONNECTED_PONG.new
    pk.pingID = 0
    pk.pingID = (packet.pingID)

    pk.encode

    sendPacket(pk, source)
  end

end