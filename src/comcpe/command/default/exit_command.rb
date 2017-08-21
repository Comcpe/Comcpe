
require './command/command'

class ExitCommand < Command

  def execute(sender, comcpe)
    comcpe.killComcpe
  end
end