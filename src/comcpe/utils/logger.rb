

=begin
# Logger File
# STDIO.
=end

require 'rubygems'
require 'color_echo'

class Logger

  attr_reader :debug

  def initialize(debug)

    @debug = debug

  end

  def readCommand
    return readline.strip
  end

  def writeMessage(msg)
    CE.fg(:white)
        .pickup('Info', :h_cyan, nil, nil)
        .pickup('Debug', :green, nil, nil)
        .pickup('Critical', :red, nil, nil)

    printf("#{msg}\n")
  end

  def info(msg)
    writeMessage("Info > #{msg}")
  end

  def debug(msg)
    if @debug
      writeMessage("Debug > #{msg}")
    end
  end

  def critical(msg)
    writeMessage("Critical > #{msg}")
  end

end