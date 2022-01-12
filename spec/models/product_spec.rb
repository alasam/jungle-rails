require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    
    it 'should save product with all fields filled' do
      @product = Product.new 
      @product.name = 'Test Product'
      @product.price_cents = 1234
      @product.quantity = 1
      @category = Category.new
      @category.name = 'Test Category'
      @product.category = @category
      expect(@product).to be_valid
    end

    it 'should save product with name filled' do
      @product = Product.new 
      @product.name = nil
      @product.price_cents = 1234
      @product.quantity = 1
      @category = Category.new
      @category.name = 'Test Category'
      @product.category = @category
      expect(@product).to_not be_valid
      print "------------ error ="
      print @product.errors.full_messages
    end

    it 'should save product with price filled' do
      @product = Product.new 
      @product.name = "Test Product"
      @product.price_cents = nil
      @product.quantity = 1
      @category = Category.new
      @category.name = 'Test Category'
      @product.category = @category
      expect(@product).to_not be_valid
      print "------------ error ="
      print @product.errors.full_messages
    end

    it 'should save product with quantity filled' do
      @product = Product.new 
      @product.name = "Test Product"
      @product.price_cents = 1234
      @product.quantity = nil
      @category = Category.new
      @category.name = 'Test Category'
      @product.category = @category
      expect(@product).to_not be_valid
      print "------------ error ="
      print @product.errors.full_messages
    end

    it 'should save product with category filled' do
      @product = Product.new 
      @product.name = "Test Product"
      @product.price_cents = 1234
      @product.quantity = 1
      @category = Category.new
      @category.name = 'Test Category'
      @product.category = nil
      expect(@product).to_not be_valid
      print "------------ error ="
      print @product.errors.full_messages
    end

  end
end
