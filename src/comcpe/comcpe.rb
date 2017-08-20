

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

    @threadManager = ThreadManager.new
    @threadManager.registerThread(InputThread.new(self, @logger).execute)
    @threadManager.registerThread(NetworkThread.new(self).execute)

    boot

  end

  def boot
    @logger.info('Welcome to Comcpe 0.1 beta!')

  end

  def shutdown
    killComcpe
  end

  def setup

  end

  def run
    while @running

    end
  end

  def handleCommand(cmd)

    @logger.debug(cmd)
    if cmd == 'exit'
      shutdown
    end

  end

  private def killComcpe
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