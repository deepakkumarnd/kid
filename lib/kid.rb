$LOAD_PATH<< './lib'

require 'json'

require 'kid/brain'
require 'kid/version'

module Kid
  class Kid
    include Brain

    def initialize
      puts "I am a new kid."
    end

    def learn_from_file(file)
      raw_data = File.read(file)
      learn(raw_data)
    end
  end
end
