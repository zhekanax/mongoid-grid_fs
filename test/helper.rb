require 'rails'
require 'stringio'

class SIO < StringIO
  attr_accessor :filename

  def initialize(filename, *args, &block)
    @filename = filename
    super(*args, &block)
  end
end

require_relative 'testing'
require_relative '../lib/mongoid/grid_fs'

Mongoid.configure do |config|
  config.connect_to('mongoid-grid_fs_test')
end

Mongo::Logger.logger.level = Logger::INFO if defined?(Mongo) == 'constant'

# Avoid annoying deprecation warning
I18n.enforce_available_locales = false if I18n.respond_to?(:enforce_available_locales=)
