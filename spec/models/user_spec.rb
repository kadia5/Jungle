require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    it 'is valid with valid parameters' do
      @user = User.new(
        email: 'email@email.com',
        password: '123',
        password_confirmation: '123',
        first_name:"firstname",
        last_name:"lastname"
      )
      @user.save
      expect(@user).to be_present
    end
    
    it 'is invalid when email does not exist' do
      @user = User.new(
        password: '123',
        password_confirmation: '123',
        first_name:"firstname",
        last_name:"lastname"
      )
      # @user
      expect(@user).to be_invalid 
      puts @user.errors.full_messages
    end
    it 'is invalid when password does not exist' do
      @user = User.new(
        email: 'email@email.com',
        password_confirmation: '123',
        first_name:"firstname",
        last_name:"lastname"
      )
      # @user
      expect(@user).to be_invalid 
      puts @user.errors.full_messages
    end

    it 'is invalid when password_confirmation does not exist' do
      @user = User.new(
        email: 'email@email.com',
        password: '123',
        first_name:"firstname",
        last_name:"lastname"
      )
      expect(@user).to be_invalid 
      puts @user.errors.full_messages
    end

    it 'is invalid when first_name does not exist' do
      @user = User.new(
        email: 'email@email.com',
        password: '123',
        password_confirmation: '123',
        last_name:"lastname"
      )
      expect(@user).to be_invalid 
      puts @user.errors.full_messages
    end

    it 'is invalid when last_name does not exist' do
      @user = User.new(
        email: 'email@email.com',
        password: '123',
        password_confirmation: '123',
        first_name:"firstname",
      )
      expect(@user).to be_invalid 
      puts @user.errors.full_messages
    end

    it 'is invalid when password_confirmation and password does not match' do
      @user = User.new(
        email: 'email@email.com',
        password: '123',
        password_confirmation: '124',
        first_name:"firstname",
        last_name:"lastname"
      )
      expect(@user).to be_invalid 
      puts @user.errors.full_messages
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
    it 'is valid with valid parameters' do
      @user = User.new(
        email: 'email@email.com',
        password: '123',
        password_confirmation: '123',
        first_name:"firstname",
        last_name:"lastname"
      )
      @user.save
      expect(@user).to be_present
    end

    it 'is invalid when email is taken' do
      @user = User.new(
        email: 'email@email.com',
        password: '123',
        password_confirmation: '123',
        first_name:"firstname",
        last_name:"lastname"
      )
      @user.save
      @user_1 = User.new(
        email: 'EMAIL@EMAIL.com',
        password: '123',
        password_confirmation: '123',
        first_name:"firstname",
        last_name:"lastname"
      )
      @user_1.save
      expect(@user_1).to be_invalid 
      # puts @user_1.errors.full_messages
    end
  end

end
