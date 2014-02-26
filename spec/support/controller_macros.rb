module ControllerMacros

  def login_user
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:user]
      @user = create(:user, email: "tah@xx.com")
      sign_in @user
    end
  end

end