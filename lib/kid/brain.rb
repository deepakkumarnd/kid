require "kid/analyser"
require "kid/neural_network"

module Kid
  module Brain

    include Analyser
    include NeuralNetwork

    def learn(raw_data)
      data = JSON.parse(raw_data)
      @network = NeuralNetwork::Network.new
      @language_analyser = Analyser::SentenceAnalyzer.new(@network)
      data.each do |type, sentences|
        sentences.each do |sentence|
          puts "Analysing #{type} #{sentence}"
          @language_analyser.analyse(type, sentence)
        end
      end
    end
  end
end
