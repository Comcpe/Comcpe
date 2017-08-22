class Binary

  def self.readInt(str)
    return str.unpack('V')
  end


  def self.readLong(x)

    value = x.unpack('N*')
    v = (value[0] << 32) | value[1]

    return v
  end

  def self.writeLong(value)
    data = [value >> 32, value & 0xFFFFFFFF].pack('NN')
    return data
  end
end