
require 'command/command_map'

class CommandManager

  # コマンド取得
  # @param [String] cmd
  def self.get (cmd)
    if cmd == ''
      return nil
    end
    data = cmd.split(' ')
    command = data.shift
    return CommandMap.get(command, data)
  end

  # コマンド登録
  # @param [String] command
  # @param [Command] commandClass
  def self.register(command, commandClass)
    CommandMap.register(command, commandClass)
  end

end