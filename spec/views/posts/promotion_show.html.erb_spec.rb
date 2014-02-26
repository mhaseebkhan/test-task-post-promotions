require 'spec_helper'

describe "posts/show" do

  login_user

  before(:each) do
    @post = assign(:post, stub_model(Post,
      :title => "Title",
      :content => "MyText",
      :url => "Url",
      :current_clicks => 1,
      :allowed_clicks => 2,
      :user_id => 3
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    rendered.should match(/MyText/)
    rendered.should match(/2/)
  end
end
