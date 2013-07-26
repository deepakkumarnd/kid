module NeuralNetwork
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

  class Network
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
end
