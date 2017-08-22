require '../raknet/packet/packet'

class UNCONNECTED_PONG < Packet

  ID = 0x03

  @pingID = 0
  attr_accessor :pingID


  def encode
    super(UNCONNECTED_PONG::ID)
    putLong(@pingID)
  end
end