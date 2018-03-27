require 'capybara/dsl'

class BBC_Account
  include Capybara::DSL

  SIGN_IN_LINK_ID = '#idcta-username'
  SIGN_OUT_BUTTON_TEXT = 'Sign out'

  def sign_in_link
    find(SIGN_IN_LINK_ID).click
  end

  def sign_out
    click_link(SIGN_OUT_BUTTON_TEXT)
  end

end
