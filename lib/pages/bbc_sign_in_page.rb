require 'capybara/dsl'

class BBC_Sign_In
  include Capybara::DSL

  SIGN_IN_BUTTON_ID = '#submit-button'
  USERNAME = 'user-identifier-input'
  PASSWORD = 'password-input'
  FORM_PASSWORD_ERROR_MESSAGE = '#form-message-password'
  FORM_GENERAL_ERROR_MESSAGE = '#form-message-username'

  def input_username(username)
    fill_in(USERNAME, with: username)
  end

  def input_password(password)
    fill_in(PASSWORD, with: password)
  end

  def sign_in_button
    find(SIGN_IN_BUTTON_ID).click
  end

  def password_error_message
    find(FORM_PASSWORD_ERROR_MESSAGE).visible?
  end

  def general_error_message
    find(FORM_GENERAL_ERROR_MESSAGE).visible?
  end

  def get_url
    current_url
  end

end
