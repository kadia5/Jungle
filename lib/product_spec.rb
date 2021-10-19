
describe 'category#name' do
  it 'should validate name' do
    @category = Category.new(name: 'name')
    Product_example.new(
      name: 'name',
      price_cents: 1000,
      quantity: 2,
      category: @category
    )
    @product.save!
    expect(@category.name).to be_nil
  end

  it 'should validate price' do
    @category = Category.new(name: 'name')
    Product_example.new(
      name: 'name',
      price_cents: 2000,
      quantity: 3,
      category: @category
    )
    @product.save!
    expect(@category.name).to be_nil
  end

  it 'should validate quantity' do
    @category = Category.new(name: 'name')
    Product_example.new(
      name: 'name',
      price_cents: 3000,
      quantity: 4,
      category: @category
    )
    @product.save!
    expect(@category.name).to be_nil
  end

  it 'should validate category' do
    @category = Category.new(name: 'name')
    Product_example.new(
      name: 'name',
      price_cents: 4000,
      quantity: 5,
      category: @category
    )
    @product.save!
    expect(@category.name).to be_nil
  end
end