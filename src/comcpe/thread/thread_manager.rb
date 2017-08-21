
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

  def execute(ids)
    ids.each { | id |
      @threads[id].execute
    }

  end

  def killThread(id)
    thread = @threads[id]

    if thread.nil?
      return false
    end

    print thread
    thread.kill
  end

  def killAllThreads

    @threads.each { |thread|

      if thread.nil?
        next
      end

      thread.kill

    }

  end

  def printThreads
    puts @threads
  end

  def getThreadsCount
    return @threads.count
  end

end