class InputThread

  attr_reader :main ,  # Comcpe #
              :logger, # Logger #
              :thread  # Thread #

  def initialize (main, logger)
    @main = main
    @logger = logger
  end

  def execute
    @thread = Thread.new do

      while @main.isRunning
        @main.handleCommand(@main, @logger.readCommand)
      end

    end

  end

  def kill
    if !@thread.nil?
      @thread.kill
    end

  end

end