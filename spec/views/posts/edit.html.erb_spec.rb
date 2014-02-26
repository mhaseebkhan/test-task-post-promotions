require 'spec_helper'

describe "posts/edit" do

  login_user

  before(:each) do

    @post = assign(:post, stub_model(Post,
      :title => "MyString",
      :content => "MyText",
      :url => "MyString",
      :current_clicks => 1,
      :allowed_clicks => 1,
      :user_id => 1
    ))
  end

  it "renders the edit post form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", post_path(@post), "post" do
      assert_select "input#post_title[name=?]", "post[title]"
      assert_select "textarea#post_content[name=?]", "post[content]"
      assert_select "input#post_url[name=?]", "post[url]"
      assert_select "input#post_allowed_clicks[name=?]", "post[allowed_clicks]"
    end
  end
end
