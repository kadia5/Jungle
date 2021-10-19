require 'rails_helper'

RSpec.describe Product, type: :model do

  it 'is valid with valid parameters' do
    @category = Category.new(name: 'name')
    @product = Product.new(
      name: 'name',
      price_cents: 1000,
      quantity: 2,
      category: @category
    )
    @product.save!
    expect(@product.id).to be_present
  end

  it 'it is invalid when name does not exist' do
    @category = Category.new(name: 'name')
    @product = Product.new(
      price_cents: 2000,
      quantity: 3,
      category: @category
    )
    #returns a boolean any/t '?'
    @product.valid?
    expect(@product.valid?).to eq false
    #can also use as an eval w/t add-on = names cant be blank
    puts @product.errors.full_messages

  end

  it 'it is invalid when price_cents does not exist' do
    @category = Category.new(name: 'name')
    @product = Product.new(
      name: 'name',
      quantity: 3,
      category: @category
    )
    @product.valid?
    expect(@product.valid?).to eq false
    puts @product.errors.full_messages
  end

  it 'it is invalid when quantity does not exist' do
    @category = Category.new(name: 'name')
    @product = Product.new(
      name: 'name',
      price_cents: 2000,
      category: @category
    )
    @product.valid?
    expect(@product.valid?).to eq false
    puts @product.errors.full_messages
  end

  it 'it is invalid when category does not exist' do
    @category = Category.new(name: 'name')
    @product = Product.new(
      name: 'name',
      price_cents: 2000,
      quantity: 3,
    )
    @product.valid?
    expect(@product.valid?).to eq false
    puts @product.errors.full_messages
  end
end