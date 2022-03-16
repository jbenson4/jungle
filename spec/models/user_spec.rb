require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'creates a valid user' do
      a_user = User.create(:first_name => "Bob", :last_name => "Smith", :email => "user@example.com", :password => "password", :password_confirmation => "password")    
      expect(a_user).to be_valid
    end
    it 'rejects incorrect password confirmation' do
      a_user = User.create(:first_name => "Bob", :last_name => "Smith", :email => "user@example.com", :password => "password", :password_confirmation => "pasword")    
      expect(a_user).to_not be_valid
    end
    it 'requires an email to be valid' do
      a_user = User.create(:first_name => "Bob", :last_name => "Smith", :email => nil, :password => "password", :password_confirmation => "password")    
      expect(a_user).not_to be_valid
    end
    it 'requires a first name to be valid' do
      a_user = User.create(:first_name => nil, :last_name => "Smith", :email => "user@example.com", :password => "password", :password_confirmation => "password")    
      expect(a_user).to_not be_valid
    end
    it 'requires a last name to be valid' do
      a_user = User.create(:first_name => "Bob", :last_name => nil, :email => "user@example.com", :password => "password", :password_confirmation => "password")    
      expect(a_user).to_not be_valid
    end
    it 'ensures emails are unique' do
      user1 = User.create(:first_name => "Bob", :last_name => "Smith", :email => "user@example.com", :password => "password", :password_confirmation => "password")   
      user2 = User.create(:first_name => "Bob", :last_name => "Smith", :email => "USER@EXAMPLE.com", :password => "password", :password_confirmation => "password")    
      expect(user2).not_to be_valid
    end
    it 'should have a password minimum length' do
      a_user = User.create(:first_name => "Bob", :last_name => "Smith", :email => "user@example.com", :password => "p", :password_confirmation => "p")    
      expect(a_user).not_to be_valid
    end
  end

  describe 'authenticate_with_credentials' do
    a_user = User.create(:first_name => "Bob", :last_name => "Smith", :email => "user@example.com", :password => "password", :password_confirmation => "password")    
    it 'accepts whitespace before/after email address' do
      user = User.authenticate_with_credentials('  user@example.com  ', 'password')
      expect(user).not_to be_nil
    end
    it 'accepts emails that are case insensitive' do
      user = User.authenticate_with_credentials('  uSer@exampLe.com  ', 'password')
      expect(user).not_to be_nil
    end
  end
end