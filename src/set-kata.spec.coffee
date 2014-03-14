Set = require('../src/set-kata.coffee')

describe "about set_kata", ->

  set = undefined

  beforeEach ->
    set = new Set()


  describe "initialize", ->
    it 'should start empty', ->
      set.getLength().should.equal 0

  describe "#add", ->
    it 'should add element', ->
      set.getLength().should.equal 0
      set.add(55)
      set.getLength().should.equal 1

  describe "#remove", ->
    it 'should remove element', ->
      set.add(55)
      set.add(22)
      set.remove(55)
      set.getLength().should.equal 1

  describe "#concat", ->
    it 'should concat', ->
      set.add('a')
      set2 = new Set()
      set2.add(55)
      set.concat(set2)
      set.getLength().should.equal 2
      mySet = set.getSet()
      (!!~mySet.indexOf 'a').should.be.true
      (!!~mySet.indexOf 55).should.be.true

  describe "#contains", ->
    it 'should identfy contents', ->
      set.add 55
      set.contains(55).should.be.true
      set.contains(22).should.not.be.true
