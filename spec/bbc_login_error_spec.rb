require "spec_helper"

describe "Incorrect user details produces valid error" do

  context "it should with the correct error when incorrect details are input" do

    it "should produce an error when inputting an incorrect email with an incorrect password" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.input_username('cberer')
      @bbc_site.bbc_sign_in_page.input_password('testdh76')
      @bbc_site.bbc_sign_in_page.sign_in_button
      expect(@bbc_site.bbc_sign_in_page.general_error_message).to be true
    end

    it "should produce an error when inputting an incorrect email with a valid password" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.input_username('cberer')
      @bbc_site.bbc_sign_in_page.input_password('dummy_password123')
      @bbc_site.bbc_sign_in_page.sign_in_button
      expect(@bbc_site.bbc_sign_in_page.general_error_message).to be true

    end

    it "should produce an error when inputting and incorrect password to a valid account" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.input_username('e1753019@nwytg.com')
      @bbc_site.bbc_sign_in_page.input_password('dummy_password1')
      @bbc_site.bbc_sign_in_page.sign_in_button
      expect(@bbc_site.bbc_sign_in_page.password_error_message).to be true
    end

    it "should not produce an error when inputting a correct email with a correct password" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.input_username('e1753019@nwytg.com')
      @bbc_site.bbc_sign_in_page.input_password('dummy_password123')
      @bbc_site.bbc_sign_in_page.sign_in_button
      @bbc_site.bbc_account_page.sign_in_link
      @bbc_site.bbc_account_page.sign_out
      expect(@bbc_site.bbc_sign_in_page.get_url).to eq("https://account.bbc.com/signout")
    end
  end

  context "user should be able to register" do
    it "should not produce an error when inputting a correct email with a correct password" do
      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_sign_in_page.input_username('e1753019@nwytg.com')
      @bbc_site.bbc_sign_in_page.input_password('dummy_password123')
      @bbc_site.bbc_sign_in_page.sign_in_button
      @bbc_site.bbc_account_page.sign_in_link
      @bbc_site.bbc_account_page.sign_out
      expect(@bbc_site.bbc_sign_in_page.get_url).to eq("https://account.bbc.com/signout")
    end
  end
end
