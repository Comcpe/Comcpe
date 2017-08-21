=begin
CommandMap can't be a object!!!
HashMap for Command
=end

class CommandMap

  @@commands = {}

    # コマンド取得
    # @param [String] command
    # @param []
  def self.get (command, data)
    if @@commands[command].nil?
      return nil
    end

    return @@commands[command].new(data)

  end

  def self.register(command, commandClass)
    @@commands[command] = commandClass
  end

  def initialize
    raise "Command Map can't be a object!"
  end
end