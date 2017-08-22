require '../raknet/binary'

class Packet

  ID = -1

  attr_accessor :buffer

  attr_reader :offset

  @buffer = ''

  def initialize
    @offset = 0
    @buffer = ''
  end

  def self.getId
    return self::ID
  end

  def setBuffer(buffer)
    @buffer = buffer
  end

  def getBuffer
    return @buffer
  end

  def getData(length)
    if length < 0
      @offset = @buffer.length - 1
      return ''

    elsif length.nil?
      return @buffer[@offset...length]
    end

    start = @offset
    @offset += length
    return @buffer[start, length]

  end

  def getInt
    return Binary.readInt(getData(4))
  end

  def getByte
    @offset += 1
    return buffer[@offset-1].ord
  end

  def getShort

  end

  def getLong
    return Binary.readLong(getData(8))
  end

  def getFloat

  end

  def getString

  end

  def putData

  end

  def putInt

  end

  def putByte

  end

  def putShort

  end

  def putLong(v)
    @buffer += Binary.writeLong(v)
  end

  def putFloat

  end

  def putString

  end

  def encode(id)
    @buffer = id.chr
  end

  def decode
    @offset = 1
    return
  end

end