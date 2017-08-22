require '../raknet/packet/packet'

class UNCONNECTED_PING < Packet

  ID = 0x01
  @pingID = 0

  attr_accessor :pingID

  def encode
    super
  end

  def decode
    super

    @pingID = getLong
  end

end