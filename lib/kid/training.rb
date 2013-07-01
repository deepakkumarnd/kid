require 'json'

module Kid
  class Kid
    def learn(data_file)
      data = JSON.parse(File.read(data_file))
      data.each do |key, value|
        value.each do |sentence|
          puts "learning: #{sentence}"
          brain.analyse_and_feed(sentence)
        end
      end
    end
  end
end
