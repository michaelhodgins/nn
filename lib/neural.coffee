math = require './math.coffee'

class Neuron
  constructor: (@numInputs = 2) ->
    @weights = new Array @numInputs
    @bias = math.rand()

    @weights[i] = math.rand() for i in [0...@weights.length] by 1

  process: (inputs) ->
    sum = 0

    sum += inputs[i] * @weights[i] for i in [0...inputs.length] by 1
    sum += @bias

    math.sigmoid sum


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

exports.Network = Network
