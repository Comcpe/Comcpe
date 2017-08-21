class CommandManager

  def self.get (cmd)
    if cmd == ''
      return nil
    end
    data = cmd.split(' ')
    command = data.shift
    return CommandMap.get(command, data)
  end

end