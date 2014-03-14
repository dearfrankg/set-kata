
###
SPECS

- Cart Project
- 2 kinds of products books and other
- most products calculate gross price by adding 20% VAT
- books have a 7% VAT
- buyers can put products in the cart
- cart should calculate gross price as the sum of all products
- when adding a product it should be removed from stock 

NOTE: Missing Stock implentation so you will need to mock it
###

{ Cart, Product, Book, Stock } = require('../src/cart')


describe "about cart", ->

  cart = null

  beforeEach ->
    cart = Cart.create()

  describe ".create", ->
    it 'should create cart with zero items', ->
      cart = Cart.create()
      cart.numItems().should.equal 0


  describe "#add", ->
    it 'should add a product to the cart', ->
      product = {name: 'Mustang GT'}
      cart.add(product)
      cart.doesContain(product).should.be.true

    it 'should deduct product from stock', ->
      spy = sinon.spy(Stock, 'removeProduct')
      product = {name: 'SuperTV'}
      cart.add(product)
      spy.should.have.been.calledWith 'SuperTV'


  describe "#doesContain", ->
    it 'should return false for a product that is not contained', ->
      anotherProduct = {}
      cart.doesContain(anotherProduct).should.be.false


  describe "#grossPriceSum", ->
    it 'should return zero for an empty cart', ->
      cart.grossPriceSum().should.equal 0

    it 'should return the gross price for a single item in the cart', ->
      product = {grossPrice: -> 10}
      cart.add(product)
      cart.grossPriceSum().should.equal 10

    it 'should return the sum for the two items in the cart', ->
      product1 = {grossPrice: -> 10}
      product2 = {grossPrice: -> 5}
      cart.add(product1)
      cart.add(product2)
      cart.grossPriceSum().should.equal 15


describe "about product", ->
  describe "#grossPrice", ->
    it 'should calculate its gross price by adding a VAT of 20%' , ->
      product = Product.create('Toaster', 100)
      product.grossPrice().should.equal 120


describe "about book", ->
  describe "#grossPrice", ->
    it 'should calculate its gross price by adding a VAT of 7%' , ->
      book = Book.create('StudyBook', 100)
      book.grossPrice().should.equal 107





















































