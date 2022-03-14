require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'validates name' do
      product = Product.new(name => 'Food')
      expect(product['name']).to be present
    end
  end
end
