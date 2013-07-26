require "kid/neural_network"

module Kid
  module Brain
    module Analyser
      class SentenceAnalyzer
        def initialize(network)
          @network = network
        end

        def analyse(sentence_type, sentence)
          @type = sentence_type
          @tokens = tokenize(sentence)
          target = nil
          @tokens.each do |token|
            neuron = NeuralNetwork::Neuron.new(token)
            target = @network.add(target, neuron)
          end
        end

        def tokenize(sentence)
          sentence.downcase.split(' ')
        end
      end
    end
  end
end
