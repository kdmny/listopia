module Listopia
  def self.configure(&block)
    yield @config ||= Listopia::Configuration.new
  end

  def self.config
    @config
  end

  # Configuration class
  class Configuration
    include ActiveSupport::Configurable
  end

  configure do |config|
  end
end