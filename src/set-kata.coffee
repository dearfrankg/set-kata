

Set = ->
  @.set = []
  return

Set:: =

  constructor: Set

  getLength: ->
    @set.length

  getSet: ->
    @set

  add: (item) ->
    @.set.push item

  remove: (item) ->
    @.set.splice(@set.indexOf item, 1)

  concat: (set) ->
    @set = @set.concat set.getSet()

  doesContain: (item) ->
    !!~@set.indexOf item


module.exports = Set


