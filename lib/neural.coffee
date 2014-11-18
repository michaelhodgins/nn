math = require './math.coffee'

class Neuron
  constructor: (@numInputs = 2) ->
    @weights = new Array @numInputs
    @bias = math.rand()

    @weights[i] = math.rand() for i in [0...@weights.length] by 1

  process: (inputs) ->
    @lastInputs = inputs
    sum = 0

    sum += inputs[i] * @weights[i] for i in [0...inputs.length] by 1
    sum += @bias

    @lastOutput = math.sigmoid sum
    @lastOutput


class Layer
  constructor: (@numNeurons, @numInputs) ->
    @neurons = new Array @numNeurons

    @neurons[i] = new Neuron @numInputs for i in [0...@neurons.length] by 1

  process: (inputs) ->
    @neurons.map (neuron) ->
      neuron.process inputs

class Network
  constructor: ->
    @layers = []

  process: (inputs) ->
    outputs = null
    for layer in @layers
      outputs = layer.process inputs
      inputs = outputs
    outputs

  addLayer: (numNeurons, numInputs = false) ->
    if not numInputs
      previousLayer = @layers[@layers.length - 1]
      numInputs = previousLayer.neurons.length

    layer = new Layer numNeurons, numInputs
    @layers.push layer

  train: (examples) ->
    [inputLayer, ..., outputLayer] = @layers
    learningRate = 0.27
    iterations = 300000
    errorThreshold = 0.00002

    for it in [0...iterations] by 1

      for e in [0...examples.length] by 1
        inputs = examples[e][0]
        targets = examples[e][1]

        outputs = @process inputs

        for i in [0...outputLayer.neurons.length] by 1
          neuron = outputLayer.neurons[i]
          neuron.error = targets[i] - outputs[i]
          neuron.delta = neuron.lastOutput * (1 - neuron.lastOutput) * neuron.error

        for l in [@layers.length - 2..0] by -1
          for j in [0...@layers[l].neurons.length] by 1
            neuronJ = @layers[l].neurons[j]
            neuronJ.error = math.sum @layers[l + 1].neurons.map (n) ->
              n.weights[j] * n.delta
            neuronJ.delta = neuronJ.lastOutput * (1 - neuronJ.lastOutput) * neuronJ.error

            for i in [0...@layers[l + 1].neurons.length] by 1
              neuronI = @layers[l + 1].neurons[i]

              for w in [0...neuronI.weights.length] by 1
                neuronI.weights[w] += learningRate * neuronI.lastInputs[w] * neuronI.delta
              neuronI.bias += learningRate * neuronI.delta

      error = math.mse outputLayer.neurons.map (n) ->
#        console.log 'n.error', n.error
        n.error

      if it % 10000 is 0
        console.log
          iteration: it
          mse: error

      return if error <= errorThreshold



exports.Network = Network
