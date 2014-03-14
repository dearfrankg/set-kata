Cart = {

  create: ->
    Object.create(Cart).init()

  init: ->
    @_items = []
    @

  add: (item) ->
    @_items.push item
    Stock.removeProduct(item.name)

  doesContain: (item) ->
    @_items.indexOf(item) isnt -1

  numItems: ->
    @_items.length

  grossPriceSum: ->
    @_items
    .map( (item) -> item.grossPrice() )
    .reduce((sum, grossPrice) -> 
      sum += grossPrice
    , 0)

}


Product = {

  _VAT_RATE: 1.20

  create: (name, price) ->
    Object.create(Product).init(name, price)

  init: (name, price) ->
    @_name = name
    @_price = price
    @

  name: ->
    @_name

  setName: (name) ->
    @_name = name

  grossPrice: ->
    @_price * @_VAT_RATE

}


Book = {

  create: (name, price) ->
    Object.create(Product, { _VAT_RATE: { value: 1.07 }})
    .init(name, price)

}


Stock = {

  removeProduct: ->

}


module.exports =
  Cart: Cart
  Product: Product
  Book: Book
  Stock: Stock