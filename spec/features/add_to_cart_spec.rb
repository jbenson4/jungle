require 'rails_helper'

RSpec.feature "Visitor adds item to cart", type: :feature, js: true do
   # Setup
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

  scenario "They add item to cart" do
    # ACT
    visit root_path
    click_on('Add', match: :first)
    # DEBUG / VERIFY
    expect(page).to have_link 'My Cart (1)'
    save_screenshot
  end
end
