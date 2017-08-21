class Command

  # 初期化
  # @param [Player | Comcpe] sender
  def initialize(args)
    @args = args
  end

  # 実行
  # @param [Comcpe] comcpe
  def execute(sender, comcpe)

  end

  def getArgs
    return @args
  end
end