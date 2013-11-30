require "spec_helper"

describe "Authentication" do

  subject { page }

  describe "register page" do
    before { visit new_user_registration_path }

    it { should have_selector("h2", text: "Register") }
    it { should have_title("Register") }
  end

  describe "register" do
    before { visit new_user_registration_path }

    context "with invalid information" do
      before { click_button "Register" }

      it { should have_title("Register") }
      it { should have_selector("div.input.error") }
    end

    context "with valid information" do
      let(:user) { FactoryGirl.attributes_for(:user) }
      before do
        fill_in "Email",                 with: user[:email].upcase
        fill_in "Password",              with: user[:password]
        fill_in "Password confirmation", with: user[:password]
        click_button "Register"
      end

      it { should have_link("Logout",    href: destroy_user_session_path) }
      it { should_not have_link("Login", href: new_user_session_path) }
      it { should have_content("User Profile") }
    end
  end

  describe "login page" do
    before { visit new_user_session_path }

    it { should have_selector("h2", text: "Login") }
    it { should have_title("Login") }
  end

  describe "login" do
    before { visit new_user_session_path }

    context "with invalid information" do
      before { click_button "Login" }

      it { should have_title("Login") }
      it { should have_selector("div.alert-box.warning") }
    end

    context "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before do
        fill_in "Email",    with: user.email.upcase
        fill_in "Password", with: user.password
        click_button "Login"
      end

      it { should have_link("Logout",    href: destroy_user_session_path) }
      it { should_not have_link("Login", href: new_user_session_path) }

      describe "followed by logout" do
        before { click_link "Logout" }
        it { should have_link("Login") }
      end
    end
  end
end
