require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    
    it "should save successfully if given all required fields" do
      @user = User.new(name: "Kasey", email: "a@a.com", password: "password", password_confirmation: "password")
      @user.save
      
      expect(@user.errors.full_messages).to be_empty
      expect(@user).to be_valid
    end

    it "should not save successfully if password and password_confirmation do not match" do
      @user = User.new(name: "Kasey", email: "a@a.com", password: "password", password_confirmation: "Password")
      @user.save
      
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      expect(@user).to be_invalid
    end

    it "should not save successfully if given an email that already exists in database" do
      @user1 = User.new(name: "Kasey", email: "a@a.com", password: "password", password_confirmation: "password")
      @user1.save

      @user2 = User.new(name: "Kasey", email: "a@a.com", password: "password", password_confirmation: "password")
      @user2.save
      
      expect(@user2.errors.full_messages).to include("Email has already been taken")
      expect(@user2).to be_invalid
    end

    it "should not save successfully if given an email that already exists in database with case sensitivity" do
      @user1 = User.new(name: "Kasey", email: "A@A.com", password: "password", password_confirmation: "password")
      @user1.save

      @user2 = User.new(name: "Kasey", email: "a@a.com", password: "password", password_confirmation: "password")
      @user2.save
      
      expect(@user2.errors.full_messages).to include("Email has already been taken")
      expect(@user2).to be_invalid
    end

    it "should not save successfully if name field is empty" do
      @user = User.new(name: nil, email: "a@a.com", password: "password", password_confirmation: "password")
      @user.save
      
      expect(@user.errors.full_messages).to include("Name can't be blank")
      expect(@user).to be_invalid
    end

    it "should not save successfully if email field is empty" do
      @user = User.new(name: "Kasey", email: nil, password: "password", password_confirmation: "password")
      @user.save
      
      expect(@user.errors.full_messages).to include("Email can't be blank")
      expect(@user).to be_invalid
    end

    it "should not save successfully if email field is empty" do
      @user = User.new(name: "Kasey", email: nil, password: "password", password_confirmation: "password")
      @user.save
      
      expect(@user.errors.full_messages).to include("Email can't be blank")
      expect(@user).to be_invalid
    end

    it "should not save successfully if password field is empty" do
      @user = User.new(name: "Kasey", email: "a@a.com", password: nil, password_confirmation: "password")
      @user.save
      
      expect(@user.errors.full_messages).to include("Password can't be blank")
      expect(@user).to be_invalid
    end

    it "should not save successfully if password is less than 6 characters" do
      @user = User.new(name: "Kasey", email: "a@a.com", password: "pass", password_confirmation: "pass")
      @user.save
      
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      expect(@user).to be_invalid
    end
  end

  describe '.authenticate_with_credentials' do
    it "should login successfully if email is found" do
      @user = User.new(name: "Kasey", email: "a@a.com", password: "password", password_confirmation: "password")
      @user.save

      @user1 = User.authenticate_with_credentials("a@a.com", "password")
      
      expect(@user).to eq(@user1)
    end

    it "should login successfully if email is in different case" do
      @user = User.new(name: "Kasey", email: "a@a.com", password: "password", password_confirmation: "password")
      @user.save

      @user1 = User.authenticate_with_credentials("A@A.com", "password")
      
      expect(@user).to eq(@user1)
    end

    it "should login successfully if email has extra spaces on sides" do
      @user = User.new(name: "Kasey", email: "a@a.com", password: "password", password_confirmation: "password")
      @user.save

      @user1 = User.authenticate_with_credentials("  a@a.com   ", "password")
      
      expect(@user).to eq(@user1)
    end

    it "should not login successfully if password is wrong" do
      @user = User.new(name: "Kasey", email: "a@a.com", password: "password", password_confirmation: "password")
      @user.save

      @user1 = User.authenticate_with_credentials("a@a.com", "passwords")
      
      expect(@user).not_to eq(@user1)
    end
  end
end
