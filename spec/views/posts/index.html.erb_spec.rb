require 'spec_helper'

describe "posts/index" do

  login_user

  before(:each) do
    assign(:posts, [
      stub_model(Post,
        :title => "Title",
        :content => "MyText",
        :url => "Url",
        :current_clicks => 1,
        :allowed_clicks => 2,
        :user_id => 3
      ),
      stub_model(Post,
        :title => "Title",
        :content => "MyText",
        :url => "Url",
        :current_clicks => 1,
        :allowed_clicks => 2,
        :user_id => 3
      )
    ])
  end

  it "renders a list of posts" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => "Url".to_s, :count => 2
  end
end
