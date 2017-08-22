class Packet

  @@id = -1

  attr_accessor :buffer

  attr_reader :offset
  @offset = 0

  def self.getId
    return @@id
  end

  def getData(length)
    if length < 0
      @offset = buffer.length - 1
      return '';

    elsif length.nil?
      return buffer[@offset...length]
    end

    @offset += length
    return buffer[@offset-length...length]

  end

  def getInt
    return getData(4)
  end

  def getByte
    @offset += 1
    return buffer[@offset-1].ord
  end

  def getShort

  end

  def getLong

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

  def putLong

  end

  def putFloat

  end

  def putString

  end

end