neural = require '../lib/neural.coffee'
network = new neural.Network()

network.addLayer 10, 20 #hidden layer
network.addLayer 2 #output layer

zero = [
  0, 1, 1, 0
  1, 0, 0, 1
  1, 0, 0, 1
  1, 0, 0, 1
  0, 1, 1, 0
]
zero1 = [
  1, 1, 1, 1
  1, 0, 0, 1
  1, 0, 0, 1
  1, 0, 0, 1
  1, 1, 1, 1
]

one = [
  0, 0, 1, 0
  0, 0, 1, 0
  0, 0, 1, 0
  0, 0, 1, 0
  0, 0, 1, 0
]

two = [
  0, 1, 1, 0
  1, 0, 0, 1
  0, 0, 1, 0
  0, 1, 0, 0
  1, 1, 1, 1
]

three = [
  1, 1, 1, 1
  0, 0, 0, 1
  0, 1, 1, 1
  0, 0, 0, 1
  1, 1, 1, 1
]

three1 = [
  1, 1, 1, 0
  0, 0, 0, 1
  0, 1, 1, 1
  0, 0, 0, 1
  1, 1, 1, 0
]

three2 = [
  1, 1, 1, 1
  0, 0, 0, 1
  0, 1, 1, 1
  0, 0, 0, 1
  1, 1, 1, 0
]

network.train [
  [zero, [0, 0]]
  [zero1, [0, 0]]
  [one, [0, 1]]
  [two, [1, 0]]
  [three, [1, 1]]
  [three1, [1, 1]]
  [three2, [1, 1]]
]


outputs = network.process [
  0, 1, 1, 0
  1, 0, 0, 1
  1, 0, 0, 1
  1, 0, 0, 1
  1, 1, 1, 1
]

# outputs === [~1, ~0]

binary = outputs.map (v) ->
  Math.round v
.join('')

decimal = parseInt binary, 2

console.log 'Recognized', decimal, outputs



outputs = network.process [
  0, 1, 1, 0
  0, 0, 1, 0
  0, 0, 1, 0
  0, 0, 1, 0
  0, 0, 1, 0
]

# outputs === [~1, ~0]

binary = outputs.map (v) ->
  Math.round v
.join('')

decimal = parseInt binary, 2

console.log 'Recognized', decimal, outputs



outputs = network.process [
  1, 1, 1, 1
  1, 0, 0, 1
  0, 0, 1, 0
  0, 1, 0, 0
  1, 1, 1, 0
]

# outputs === [~1, ~0]

binary = outputs.map (v) ->
  Math.round v
.join('')

decimal = parseInt binary, 2

console.log 'Recognized', decimal, outputs


outputs = network.process [
  1, 1, 1, 1
  0, 0, 0, 1
  0, 1, 1, 0
  0, 0, 0, 1
  1, 1, 1, 1
]

# outputs === [~1, ~0]

binary = outputs.map (v) ->
  Math.round v
.join('')

decimal = parseInt binary, 2

console.log 'Recognized', decimal, outputs
