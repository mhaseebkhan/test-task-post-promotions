require 'spec_helper'

describe User do

  it "should create a new instance of a user given valid attributes" do
    create(:user).should be_valid
  end

  it "should validate password confirmation" do
    build(:user, password_confirmation: '2582').should_not be_valid
  end

  it "should validate duplicate email" do
    create(:user, email: "john@example.com")
    build(:user, email: "john@example.com").should_not be_valid
  end

  it "should validate presence of email" do
    build(:user, email: nil).should_not be_valid
  end

end
