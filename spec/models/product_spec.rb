require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should save successfully when all fields are filled' do
      @category = Category.new(name: 'Furniture')
      @product = Product.new(name: 'Chair', price: 100, quantity: 10, category: @category)
      @product.save!
      expect(@product.id).to be_present
    end

    it 'should not save successfully when name is not filled' do
      @category = Category.new(name: 'Furniture')
      @product = Product.new(name: nil, price: 100, quantity: 10, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save successfully when price is not filled' do
      @category = Category.new(name: 'Furniture')
      @product = Product.new(name: 'Chair', price: nil, quantity: 10, category: @category)
      @product.save
      expect(@product.errors[:price].any?).to be_truthy
    end

    it 'should not save successfully when quantity is not filled' do
      @category = Category.new(name: 'Furniture')
      @product = Product.new(name: 'Chair', price: 100, quantity: nil, category: @category)
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should not save successfully when category is not filled' do
      @category = Category.new(name: 'Furniture')
      @product = Product.new(name: 'Chair', price: 100, quantity: 10, category: nil)
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
