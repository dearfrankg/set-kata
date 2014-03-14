

Set = ->
  @.set = []
  return

Set:: =

  constructor: Set

  getSet: ->
    @set

  getLength: ->
    @set.length

  add: (item) ->
    @.set.push item

  remove: (item) ->
    @.set.splice(@set.indexOf item, 1)

  concat: (set) ->
    @set = @set.concat set.getSet()

  contains: (item) ->
    !!~@set.indexOf item

  say: (item) ->
    console.log item




module.exports = Set


