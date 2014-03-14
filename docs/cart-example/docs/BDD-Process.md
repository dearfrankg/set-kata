# BDD Development Process

## SPECS
- Cart Project
- 2 kinds of products books and other
- most products calculate gross price by adding 20% VAT
- books have a 7% VAT
- buyers can put products in the cart
- cart should calculate gross proce as the sum of all products


## CREATE HIGH-LEVEL OR ACCEPTANCE TESTS
- tests for the customers
- for these test the app is the SUT
- multiple subjects not a problem here
- high level specs help discover what low level specs will be
- low level specs one SUT per test


## CODE YOUR WAY IN
- to code the high level specs is to code the whole app skip
  these specs with the skip feature
- and code one low level SUT at a time


## ORGANIZE YOUR SPECS
- organize by feature or by fixture
- here we will organize by feature create, add, grossPriceSum
- don't be surprised customer missed feature, they always do


## TEST CONVENTIONS
- dot indicates called on the prototype: .create
- hash indicates called on the instance: #add


## SPEC1 SUT .create

desc: .create
  it: should create a cart that contains 0 products
    newCart = Cart.create();
    expect newCart.numProducts() toEqual 0


## CODE THE MINIMUM TO GET GREEN

Cart
  create: -> Object.create(Cart).init()
  init: -> this
  numProducts: -> 0


## SPEC2 SUT #add

desc: #add
  it: should add a product to the cart
    cart = Cart.create()
    product = {}
    cart.add(product)


- what's with that fake product?
- better not to build the product and be dependent on it
- changes in a real product might force changes in the spec
- better to have the cart spec only dependent on the cart

## DOUBLE THE PRODUCT WITH A TEST DOUBLE

- we will use a dummy
- dummies don't do anything
- their purpose is to replace real objects


## FINISH SPEC2

desc: #add
  it: should add a product to the cart
    cart = Cart.create()
    product = {}
    cart.add(product)
    expect cart.numProducts() toEqual 1


## TRIANGULATION
- you know these test could pass on bogus code
- you need to find ways to stop the tricky programmers
- in doing so you will fill out your specs

## HOW CAN THEY FAKE IT?
- They can just increment the counter when adding
- How do we know it was a product that was added?
- We need a spec to prove it

  expect cart.doesContain(product) toEqual true

- They could just say true for any param, we need to test against that
- often times negation is what the doctor ordered

  expect cart.doesContain(bogusProduct) toEqual false

- these specs force a real implementation


## SPEC3 SUT grossPriceSum

desc: #grossPriceSum
it: should be zero for an empty cart
  cart = Cart.create()
  expect cart.grossPriceSum() toEqual 0

- provide the usual fake implementation
- spec for a cart with a single product

desc: #grossPriceSum
it: should be gross price for a single product in the cart
  cart = Cart.create()
  product = {grossPrice: -> 10}
  cart.add(product)
  expect cart.grossPriceSum() toEqual 10

## WE'RE USING A STUB
- a dummy does not implement functions
- here we are simulating a product
- a stub uses fake values to replace implementation
- low level specs should be as specific as possible - a real product would hinder that
- TIP: isolate your low-level specs fron the non-SUT dependencies, use stubs if needed

## SPIES ARE USED FOR STUBBING

- jasmine:

spyOn(product, 'grossPrice').andReturn(10)

## BACK TO THE SPEC
- we could fake it by returning the gross price for the product in the cart
- we need more spec meat

desc: #grossPriceSum
it: should be gross price for two products in the cart
  cart = Cart.create()
  product1 = {grossPrice: -> 5}
  product2 = {grossPrice: -> 10}
  cart.add(product1)
  cart.add(product2)
  expect cart.grossPriceSum() toEqual 15


## WE'VE NABBED THE CHEATING PROGRAMMERS
- they need to code the real implementation


## WE DID RED, GREEN, TIME TO REFACTOR
- let's put cart creation in a beforeEach and use where appropriate


## CART SPECS COMPLETE, TIME FOR PRODUCT SPEC

- a product should calculate it's gross price by adding 20% VAT

desc: a product
it: should calculate its gross price by adding 20% VAT
  product = Product.create('Some Product', 100)
  expect product.grossPrice() toEqual 120


## CODE IT

## STUDYBOOK IS JUST A PRODUCT WITH AN OVERRIDDEN VAT NO SPEC NEEEDED

## DISTINGUISH BETWEEN HIGH_LEVEL AND LOW-LEVEL SPECS

high level
- there are few
- the main purpose to overiew required functionality

low level
- help find bugs
- main purpose is to help developers maintain the code
- there are usually many as there are many low level details














