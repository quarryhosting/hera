require "spec_helper"

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }

    before { visit user_path(user) }

    it { should have_content("User Profile") }
    it { should have_title("User Profile") }
  end
end
