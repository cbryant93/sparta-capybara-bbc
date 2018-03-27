require "spec_helper"

describe "Incorrect user details produces valid error" do

  # context "it should with the correct error when incorrect details are input" do
  #
  #   it "should produce an error when inputting an incorrect email with an incorrect password" do
  #     @bbc_site = BBC_Site.new
  #     @bbc_site.bbc_homepage.visit_home_page
  #     @bbc_site.bbc_homepage.click_sign_in_link
  #     @bbc_site.bbc_sign_in_page.input_username('cberer')
  #     @bbc_site.bbc_sign_in_page.input_password('testdh76')
  #     @bbc_site.bbc_sign_in_page.sign_in_button
  #     expect(@bbc_site.bbc_sign_in_page.general_error_message).to be true
  #   end
  #
  #   it "should produce an error when inputting an incorrect email with a valid password" do
  #     @bbc_site = BBC_Site.new
  #     @bbc_site.bbc_homepage.visit_home_page
  #     @bbc_site.bbc_homepage.click_sign_in_link
  #     @bbc_site.bbc_sign_in_page.input_username('cberer')
  #     @bbc_site.bbc_sign_in_page.input_password('dummy_password123')
  #     @bbc_site.bbc_sign_in_page.sign_in_button
  #     expect(@bbc_site.bbc_sign_in_page.general_error_message).to be true
  #
  #   end
  #
  #   it "should produce an error when inputting and incorrect password to a valid account" do
  #     @bbc_site = BBC_Site.new
  #     @bbc_site.bbc_homepage.visit_home_page
  #     @bbc_site.bbc_homepage.click_sign_in_link
  #     @bbc_site.bbc_sign_in_page.input_username('e1753019@nwytg.com')
  #     @bbc_site.bbc_sign_in_page.input_password('dummy_password1')
  #     @bbc_site.bbc_sign_in_page.sign_in_button
  #     expect(@bbc_site.bbc_sign_in_page.password_error_message).to be true
  #   end
  #
  #   it "should not produce an error when inputting a correct email with a correct password" do
  #     @bbc_site = BBC_Site.new
  #     @bbc_site.bbc_homepage.visit_home_page
  #     @bbc_site.bbc_homepage.click_sign_in_link
  #     @bbc_site.bbc_sign_in_page.input_username('e1753019@nwytg.com')
  #     @bbc_site.bbc_sign_in_page.input_password('dummy_password123')
  #     @bbc_site.bbc_sign_in_page.sign_in_button
  #     @bbc_site.bbc_account_page.sign_in_link
  #     @bbc_site.bbc_account_page.sign_out
  #     expect(@bbc_site.bbc_sign_in_page.get_url).to eq("https://account.bbc.com/signout")
  #   end
  # end

  context "User should be able to register" do

    it "Invalid DOB is entered when 'over 13' button is selected" do

      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_register_page.register_link
      @bbc_site.bbc_register_page.age_boundary_link
      @bbc_site.bbc_register_page.dob_day_input("01")
      @bbc_site.bbc_register_page.dob_month_input("01")
      @bbc_site.bbc_register_page.dob_year_input("2011")
      @bbc_site.bbc_register_page.click_continue_button
      expect(@bbc_site.bbc_register_page.dob_error_message).to be true

    end

    it "Invalid email type is entered" do

      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_register_page.register_link
      @bbc_site.bbc_register_page.age_boundary_link
      @bbc_site.bbc_register_page.dob_day_input("01")
      @bbc_site.bbc_register_page.dob_month_input("01")
      @bbc_site.bbc_register_page.dob_year_input("2001")
      @bbc_site.bbc_register_page.click_continue_button
      @bbc_site.bbc_register_page.input_register_email('cbryant')
      @bbc_site.bbc_register_page.input_register_password(' ')
      expect(@bbc_site.bbc_register_page.email_error_message).to be true

    end

    it "Invalid password is entered is too short" do

      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_register_page.register_link
      @bbc_site.bbc_register_page.age_boundary_link
      @bbc_site.bbc_register_page.dob_day_input("01")
      @bbc_site.bbc_register_page.dob_month_input("01")
      @bbc_site.bbc_register_page.dob_year_input("2001")
      @bbc_site.bbc_register_page.click_continue_button
      @bbc_site.bbc_register_page.input_register_email('cbryant@hotmail.com')
      @bbc_site.bbc_register_page.input_register_password('te')
      @bbc_site.bbc_register_page.register_button
      expect(@bbc_site.bbc_register_page.password_error_message).to be true

    end

    it "Error message for Invalid postcode appears" do

      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_register_page.register_link
      @bbc_site.bbc_register_page.age_boundary_link
      @bbc_site.bbc_register_page.dob_day_input("01")
      @bbc_site.bbc_register_page.dob_month_input("01")
      @bbc_site.bbc_register_page.dob_year_input("2001")
      @bbc_site.bbc_register_page.click_continue_button
      @bbc_site.bbc_register_page.input_register_email('cbryant@hotmail.com')
      @bbc_site.bbc_register_page.input_register_password('Asoiaf1993')
      @bbc_site.bbc_register_page.input_postcode('IG9FFFFF')
      @bbc_site.bbc_register_page.register_button
      expect(@bbc_site.bbc_register_page.postcode_error_message).to be true
    end

    it "Error message for no gender selected" do

      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_register_page.register_link
      @bbc_site.bbc_register_page.age_boundary_link
      @bbc_site.bbc_register_page.dob_day_input("01")
      @bbc_site.bbc_register_page.dob_month_input("01")
      @bbc_site.bbc_register_page.dob_year_input("2001")
      @bbc_site.bbc_register_page.click_continue_button
      @bbc_site.bbc_register_page.input_register_email('cbryant@hotmail.com')
      @bbc_site.bbc_register_page.input_register_password('Asoiaf1993')
      @bbc_site.bbc_register_page.input_postcode('IG95NF')
      @bbc_site.bbc_register_page.email_opt_selection('optOut')
      @bbc_site.bbc_register_page.register_button
      expect(@bbc_site.bbc_register_page.gender_error_message).to be true
    end

    it "Neither Opt-in or Opt-out of email service selected" do

      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_register_page.register_link
      @bbc_site.bbc_register_page.age_boundary_link
      @bbc_site.bbc_register_page.dob_day_input("01")
      @bbc_site.bbc_register_page.dob_month_input("01")
      @bbc_site.bbc_register_page.dob_year_input("2001")
      @bbc_site.bbc_register_page.click_continue_button
      @bbc_site.bbc_register_page.input_register_email('cbryant@hotmail.com')
      @bbc_site.bbc_register_page.input_register_password('Asoiaf1993')
      @bbc_site.bbc_register_page.input_postcode('IG95NF')
      @bbc_site.bbc_register_page.select_gender('Male')
      @bbc_site.bbc_register_page.register_button
      expect(@bbc_site.bbc_register_page.opt_error_message).to be true
    end

    it "User should Register successfully" do

      @bbc_site = BBC_Site.new
      @bbc_site.bbc_homepage.visit_home_page
      @bbc_site.bbc_homepage.click_sign_in_link
      @bbc_site.bbc_register_page.register_link
      @bbc_site.bbc_register_page.age_boundary_link
      @bbc_site.bbc_register_page.dob_day_input("01")
      @bbc_site.bbc_register_page.dob_month_input("01")
      @bbc_site.bbc_register_page.dob_year_input("1993")
      @bbc_site.bbc_register_page.click_continue_button
      @bbc_site.bbc_register_page.input_register_email('cbryant1993@gmail.com')
      @bbc_site.bbc_register_page.input_register_password('Asoiaf1993')
      @bbc_site.bbc_register_page.input_postcode('IG95NF')
      @bbc_site.bbc_register_page.select_gender('Male')
      @bbc_site.bbc_register_page.email_opt_selection('optOut')
      @bbc_site.bbc_register_page.register_button
      expect(@bbc_site.bbc_register_page.email_error_message).to eq('Looks like you’ve already registered with this email.')
      sleep 5
    end

  end
end
