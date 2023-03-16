require 'rails_helper'
require 'bcrypt'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should save successfully when all fields are filled' do
      @user = User.new(name: 'John', email: 'joemama@gmail.com', password: '123456', password_confirmation: '123456')
      @user.save!
      expect(@user.id).to be_present
    end

    it 'should not save successfully when name is not filled' do
      @user = User.new(name: nil, email: "joemama@gmail.com", password: "123456", password_confirmation: "123456")
      @user.save
      expect(@user.errors.full_messages).to include("Name can't be blank")
    end

    it 'should not save successfully when email is not filled' do
      @user = User.new(name: 'John', email: nil, password: "123456", password_confirmation: "123456")
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should not save successfully when password is not filled' do
      @user = User.new(name: 'John', email: 'joemama@gmail.com', password: nil, password_confirmation: "123456")
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should not save successfully when password_confirmation is not filled' do
      @user = User.new(name: 'John', email: "joemama@gmail.com", password: "123456", password_confirmation: nil)
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'should not save successfully when password and password_confirmation do not match' do
      @user = User.new(name: 'John', email: 'joemama@gmail.com', password: '123456', password_confirmation: '1234567')
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'should not save successfully when email is not unique (case insensitive)' do
      @user = User.new(name: 'John', email: 'joemama@gmail.com', password: '123456', password_confirmation: '123456')
      @user.save
      @user2 = User.new(name: 'Jane', email: 'Joemama@gmail.com', password: '123456', password_confirmation: '123456')
      @user2.save
      expect(@user2.errors.full_messages).to include("Email has already been taken")
    end

    it 'should not save successfully when password is less than 6 characters' do
      @user = User.new(name: 'John', email: 'joemama@gmail.com', password: '12345', password_confirmation: '12345')
      @user.save
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    describe '.authenticate_with_credentials' do
      it 'should return user if email and password are correct' do
      @user = User.new(name: 'John', email: 'joemama@gmail.com', password: '123456', password_confirmation: '123456')
      @user.save!
      expect(User.authenticate_with_credentials('JoeMama@GMail.COM', @user.password)).to eq(@user)
      end
    end
  end
end
