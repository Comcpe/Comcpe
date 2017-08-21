=begin
 sayCommand! /say <params...>
=end


require 'command/command'

class SayCommand < Command

  def execute(sender, comcpe)
    param = getArgs

    if param.count == 0
      sender.sendMessage('/say <params>')
      return
    end

    chat = getArgs.join(' ')
    comcpe.broadcastMessage("[#{sender.getName}]#{chat}")
  end

end