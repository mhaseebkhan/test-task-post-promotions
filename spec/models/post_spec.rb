require 'spec_helper'

describe Post do

  it "should create a new instance of a post given valid attributes" do
    create(:post).should be_valid
  end

  it 'should validate presence of title' do
    build(:post, title: nil).should_not be_valid
  end

  it 'should validate presence of content' do
    build(:post, content: nil).should_not be_valid
  end

  it 'should be invalid with unsigned table id' do
    build(:post, allowed_clicks: -5).should_not be_valid
  end

  it 'should validate promotion criteria' do
    build(:post, allowed_clicks: 5, current_clicks: 6).should_not be_valid
  end

end
