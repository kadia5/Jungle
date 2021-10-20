require 'rails_helper'

RSpec.feature "AddToCarts", type: :feature, js: true do
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end


  scenario "Can see updated cart after clicking on a products Add to Cart button" do
    # ACT
    visit root_path
    # link= an action.
    first('.product').click_button('Add') 

    # DEBUG 
    save_screenshot

    # VERIFY
    # testing- EXPECT product page will have the content about Description
    expect(page).to have_content 'My Cart'
    puts page.html
  end
end
