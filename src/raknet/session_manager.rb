

require '../raknet/packet/unconnected_ping'
require '../raknet/packet/packet'

class SessionManager

  def initialize(main)
    @main = main
  end

  def receivePacket(buffer, source)

    if(!buffer.nil?)
      @main.getLogger().debug("#{UnconnectedPing.getId}, #{buffer[0].ord}")
      if buffer[0].ord.equal?(UnconnectedPing.getId)
        @main.getLogger.debug('UNCONNECTED_PING!')
      end
      return true
    end

    return false
  end
end