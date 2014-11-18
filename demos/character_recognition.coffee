neural = require '../lib/neural.coffee'
network = new neural.Network()

network.addLayer 10, 20 #hidden layer
network.addLayer 2      #output layer

outputs = network.process [
  1, 1, 1, 1
  1, 0, 0, 1
  0, 0, 1, 0
  0, 1, 0, 0
  1, 1, 1, 0
]

# outputs === [~1, ~0]

#console.log 'outputs', outputs

binary = outputs.map (v) ->
  Math.round v
.join('')

decimal = parseInt binary, 2

console.log 'Recognized', decimal, outputs
