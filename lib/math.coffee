exports.rand = ->
  Math.random() * 0.4 - 0.2

exports.mse = (errors) ->
  sum = errors.reduce (sum, i) ->
    sum + Math.pow i, 2
  , 0
  sum / errors.length

exports.sum = (array) ->
  array.reduce (sum, i) ->
    sum + i
  , 0

exports.sigmoid = (x) ->
  1 / (1 + Math.pow Math.E, -x)
