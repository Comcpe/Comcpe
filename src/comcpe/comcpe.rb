

# ##
# Comcpe main file
# written by RiceField
# ##

# require
require './utils/logger'
require './thread/thread_manager'
require './thread/input_thread'
require './thread/network_thread'
require './command/command_manager'
require './command/default/exit_command'
class Comcpe

  @@VERSION = '0.1 BETA'

  # Access
  attr_reader :running


  def initialize
    @running = true
    @logger = Logger.new(false)


    boot

    @threadManager = ThreadManager.new

    ids = []

    ids << @threadManager.registerThread(InputThread.new(self, @logger))
    ids << @threadManager.registerThread(NetworkThread.new(self))
    @threadManager.execute(ids)


  end

  # Start up
  def boot
    @logger.info('Welcome to Comcpe 0.1 beta!')
    CommandManager.register('exit', ExitCommand)
  end

  # Shutdown Server
  def shutdown

    @threadManager.printThreads
    # killComcpe
    @threadManager.killAllThreads

  end

  # First Boot
  def setup

  end

  # Running
  def run
    while isRunning
    end
  end

  # Catch Command
  # @param [Player | Comcpe] sender
  # @param [String] cmd
  def handleCommand(sender, cmd)

    @logger.debug(cmd)
    command = CommandManager.get(cmd)

    if command.nil?
      @logger.info('Command not found!')
      return
    end

    command.execute(sender, self)

  end

  def killComcpe
    @running = false
  end

  def isRunning
    return @running
  end


  def getLogger
    return @logger
  end

end

comcpe = Comcpe.new
comcpe.run
comcpe.shutdown