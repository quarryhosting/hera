require 'spec_helper'

describe "Pages" do
  it "can access index" do
    visit root_path
    page.should have_content 'Quarry Hosting'
  end

  it "can access other pages" do
    visit root_path
    click_link 'Pricing'
    click_link 'Terms of Service'
    page.should have_content 'Terms of Service'
  end
end
