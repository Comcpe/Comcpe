
class ThreadManager

  # Singleton
  @@threadManager = nil
  def ThreadManager.get

    if @@threadManager.nil? # ないなら作成
      @@threadManager = ThreadManager.new
    end

    return @@threadManager

  end

  attr_reader :threads



  private :initialize
  def initialize
    @threads = []
  end

  def registerThread(thread)
    @threads << thread
    return @threads.count - 1
  end

  def killThread(id)
    thread = @threads.at(id)

    if thread.nil?
      return false
    end

    thread.kill
  end

  def killAllThreads

    [0...@threads.count].each { |id|

      killThread(@threads.at(id))

    }

  end

end