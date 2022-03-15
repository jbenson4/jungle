require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @a_category = Category.create({:name => 'Sports'})
    end
    
    it 'creates a valid product' do
      a_product = Product.create("name" => "Skateboard", "price" => 120, "quantity" => 10, "category" => @a_category)
      expect(a_product).to be_valid
    end
    it 'validates name' do
      a_product = Product.new("name" => nil, "price" => 120, "quantity" => 10, "category" => @a_category)
      expect(a_product).to_not be_valid
    end
    it 'validates price' do
      a_product = Product.new("name" => "Skateboard", "price" => nil, "quantity" => 10, "category" => @a_category)
      expect(a_product).to_not be_valid
    end
    it 'validates quantity' do
      a_product = Product.new("name" => "Skateboard", "price" => 120, "quantity" => nil, "category" => @a_category)
      expect(a_product).to_not be_valid
    end
    it 'validates category' do
      a_product = Product.new("name" => "Skateboard", "price" => 120, "quantity" => 10, "category" => nil)
      expect(a_product).to_not be_valid
    end
  end
end
