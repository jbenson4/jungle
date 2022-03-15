require 'rails_helper'

RSpec.describe User, type: :model do
  it 'creates a valid user' do
    a_user = User.create({:first_name => "Bob", :last_name => "Smith", :email => "user@example.com", :password => "password", :password_confirmation => "password"})    
    expect(a_user).to be_valid
  end
  it 'rejects incorrect password confirmation' do
    a_user = User.create({:first_name => "Bob", :last_name => "Smith", :email => "user@example.com", :password => "password", :password_confirmation => "pasword"})    
    expect(a_user).to be_valid
  end
  it 'requires an email to be valid' do
    a_user = User.create({:first_name => "Bob", :last_name => "Smith", :email => nil, :password => "password", :password_confirmation => "password"})    
    expect(a_user).to be_valid
  end
  it 'requires a first name to be valid' do
    a_user = User.create({:first_name => "Bob", :last_name => "Smith", :email => "user@example.com", :password => "password", :password_confirmation => "password"})    
    expect(a_user).to be_valid
  end
  it 'requires a last name to be valid' do
    a_user = User.create({:first_name => "Bob", :last_name => "Smith", :email => "user@example.com", :password => "password", :password_confirmation => "password"})    
    expect(a_user).to be_valid
  end
  it 'ensures emails are unique' do
    user1 = User.create({:first_name => "Bob", :last_name => "Smith", :email => "user@example.com", :password => "password", :password_confirmation => "password"})    
    user2 = User.create({:first_name => "Bob", :last_name => "Smith", :email => "USER@EXAMPLE.com", :password => "password", :password_confirmation => "password"})    
    expect(user2).to_not exist
  end
  it 'should have a password minimum length' do
    a_user = User.create({:first_name => "Bob", :last_name => "Smith", :email => "user@example.com", :password => "p", :password_confirmation => "p"})    
    expect(a_user).to_not exist
  end
end
