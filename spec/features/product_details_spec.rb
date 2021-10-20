require 'rails_helper'

RSpec.feature "ProductDetails", type: :feature, js: true do
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


  scenario "Can see product description after clicking on a products details" do
    # ACT
    visit root_path
    # link= an action.
    #Capybara goes to home page , look for first product , click link that says "Details" => product page. 
    first('.product').click_link('Details') 

    # DEBUG 
    save_screenshot

    # VERIFY
    # testing- EXPECT product page will have the content about Description
    expect(page).to have_content 'Description'
    puts page.html
  end
end
