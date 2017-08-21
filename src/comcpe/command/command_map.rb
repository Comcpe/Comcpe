class CommandMap

  @@commands = {}



  def self.get (command, data)
    if @@commands[command].nil?
      return nil
    end

    return @@commands[command].new(data)

  end
end