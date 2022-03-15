require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates a valid product' do
    a_product = Product.create("name" => "Skateboard", "price" => 120, "quantity" => 10, "category" => @a_category)
    expect(a_product).to be_valid
  end
end
