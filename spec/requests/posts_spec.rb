require 'spec_helper'

describe "Posts" do


  describe "GET /promotions" do
    it "should show promotion page" do
      get promotions_path
      response.status.should be(200)
    end
  end
end
