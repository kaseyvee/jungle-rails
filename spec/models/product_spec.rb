require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do

    it "should save successfully if given the required attributes" do
      @category = Category.new(name: "Cute Plants")

      @product = Product.new(name: "Monstera", price: 20, quantity: 9, category: @category)
      @product.save
      
      expect(@product.errors.full_messages).to be_empty
      expect(@product).to be_valid
    end

    it "should not save successfully if missing a name" do
      @category = Category.new(name: "Cute Plants")

      @product = Product.new(name: nil, price: 20, quantity: 9, category: @category)
      @product.save

      expect(@product.errors.full_messages).to include("Name can't be blank")
      expect(@product).to be_invalid
    end

    it "should not save successfully if missing a price" do
      @category = Category.new(name: "Cute Plants")

      @product = Product.new(name: "Monstera", price_cents: nil, quantity: 9, category: @category)
      @product.save

      expect(@product.errors.full_messages).to include("Price is not a number")
      expect(@product).to be_invalid
    end

    it "should not save successfully if missing a quantity" do
      @category = Category.new(name: "Cute Plants")

      @product = Product.new(name: "Monstera", price: 20, quantity: nil, category: @category)
      @product.save

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
      expect(@product).to be_invalid
    end

    it "should not save successfully if missing a category" do
      @product = Product.new(name: "Monstera", price: 20, quantity: 6, category: nil)
      @product.save

      expect(@product.errors.full_messages).to include("Category can't be blank")
      expect(@product).to be_invalid
    end

  end
end
