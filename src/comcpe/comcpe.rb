

# ##
# Comcpe main file
# written by RiceField
# ##

# require
require './utils/logger'
require './thread/thread_manager'
require './thread/input_thread'
require './thread/network_thread'

class Comcpe

  @@VERSION = '0.1 BETA'

  # Access
  attr_reader :running


  def initialize
    @running = true
    @logger = Logger.new(true)


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
  end

  # Shutdown Server
  def shutdown
    @threadManager.killAllThreads
  end

  # First Boot
  def setup

  end

  # Running
  def run
    while isRunning
      sleep(1)
    end
  end

  # Catch Command ()
  def handleCommand(sender, cmd)

    @logger.debug(cmd)

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
