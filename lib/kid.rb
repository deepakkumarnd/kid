$LOAD_PATH<< './lib'
require 'kid/version'
require 'json'

module Kid

  module Brain
    def learn(raw_data)
      data = JSON.parse(raw_data)
      @network = NeuralNetwork.new
      @language_analyser = SentenceAnalyzer.new(@network)
      data.each do |type, sentences|
        sentences.each do |sentence|
          puts "Analysing #{type} #{sentence}"
          @language_analyser.analyse(type, sentence)
        end
      end
    end

    class Neuron
      # A Neuron has basically a nuclius(data) where we store the data, an axon which
      # recives the data, and dendrites which transmits data to other neurons.
      # axon type means identifies whether it is an edge neuron or a connection
      # neuron. A connection neuron is connected to other neurons on both axon
      # and dendrites, whereas an edge neuron is connected only at the dendrites.
      attr_accessor :data, :axon, :dendrites, :type

      def initialize(data, axon=nil, type = :connection)
        @data = data
        @axon = axon
        @type = type
        @dendrites = []
      end
    end

    class NeuralNetwork
      # The brain has one neurel network which is stored using a database and the
      # network is created using training data. The network is a graph containg millions
      # of neurons. All analysis is done against this neural network.
      # @root_neurons are an array of neurons containg free axons means their axons are
      # not connected to other neurons.
      def initialize
        # load the network from the database
        @root_neurons = []
      end

     def add(target, neuron)
       if target.nil?
         neuron.type = :root
         @root_neurons.each do |n|
           return n if n.data == neuron.data
         end
         @root_neurons<< neuron
       else
         neuron.type = :connection
         return target if target.data == neuron.data
         target.dendrites.each do |n|
           return n if n.data == neuron.data
         end
         target.dendrites<< neuron
         neuron.axon = target
       end
       return neuron
     end
    end


    class SentenceAnalyzer
      def initialize(network)
        @network = network
      end

      def analyse(sentence_type, sentence)
        @type = sentence_type
        @tokens = tokenize(sentence)
        target = nil
        @tokens.each do |token|
          neuron = Neuron.new(token)
          target = @network.add(target, neuron)
        end
      end

      def tokenize(sentence)
        sentence.downcase.split(' ')
      end
    end
  end

  class Kid
    include Brain

    def initialize
    end

    def learn_from_file(file)
      raw_data = File.read(file)
      learn(raw_data)
    end
  end
end
