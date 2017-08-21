class Command

  public # @param [Player | Comcpe] sender
      def initialize(args)
    @args = args
  end

  public def execute

  end

  public def getArgs
    return @args
  end
end