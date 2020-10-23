module PlayerEmailAddressComponent
  class Start
    attr_accessor :settings

    def self.build(settings=nil)
      instance = new
      instance.settings = settings
      instance
    end

    def call
      Consumers::Commands.start('playerEmailAddress:command', settings: settings)
      Consumers::Commands::Transactions.start('playerEmailAddressTransaction', settings: settings)
    end
  end
end
