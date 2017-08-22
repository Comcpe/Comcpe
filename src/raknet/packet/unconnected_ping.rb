require '../raknet/packet/packet'

class UnconnectedPing < Packet

  @@id = 0x01

  attr_accessor :pingID

  def encode

  end

  def decode
    @pingID = getLong
  end

end