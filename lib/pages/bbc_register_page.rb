require 'capybara/dsl'

class BBC_Register
  include Capybara::DSL

  REGISTER_LINK_TEXT = 'Register now'
  AGE_BOUNDARY = '13 or over'
  DOB_DAY = 'day-input'
  DOB_MONTH = 'month-input'
  DOB_YEAR = 'year-input'
  CONTINUE_BUTTON = '#submit-button'
  EMAIL = 'user-identifier-input'
  PASSWORD = 'password-input'
  POSTCODE = 'postcode-input'
  GENDER = 'gender'
  OPT_IN = '//*[@id="marketingOptIn"]/div[1]/div[1]/label/div'
  OPT_OUT = '//*[@id="marketingOptIn"]/div[1]/div[2]/label/div'
  REGISTER_BUTTON = 'submit-button'
  DOB_BUTTON_ERROR_MESSAGE = '#form-message-dateOfBirth'
  EMAIL_ERROR_MESSAGE = '#form-message-email'
  PASSWORD_ERROR_MESSAGE = '#form-message-password'
  POSTCODE_ERROR_MESSAGE = '#form-message-hometown'
  GENDER_ERROR_MESSAGE = '#form-message-gender'
  OPT_IN_ERROR_MESSAGE = '#form-message-marketingOptIn'


  def register_link
    click_link(REGISTER_LINK_TEXT)
  end

  def age_boundary_link
    click_link(AGE_BOUNDARY)
  end

  def dob_day_input(day)
    fill_in(DOB_DAY, with: day)
  end

  def dob_month_input(month)
    fill_in(DOB_MONTH, with: month)
  end

  def dob_year_input(year)
    fill_in(DOB_YEAR, with: year)
  end

  def click_continue_button
    find(CONTINUE_BUTTON).click
  end

  def input_register_email(email)
    fill_in(EMAIL, with: email)
  end

  def input_register_password(password)
    fill_in(PASSWORD, with: password)
  end

  def input_postcode(postcode)
    fill_in(POSTCODE, with: postcode)
  end

  def select_gender(gender)
    select(gender, from: GENDER)
  end

  def email_opt_selection(choice)
    if choice == 'optIn'
      find(:xpath, OPT_IN).click
    elsif choice == 'optOut'
      find(:xpath, OPT_OUT).click
    else
      throw
    end
  end

  def register_button
    click_button(REGISTER_BUTTON)
  end

  def dob_error_message
    find(DOB_BUTTON_ERROR_MESSAGE).visible?
  end

  def email_error_message
    find(EMAIL_ERROR_MESSAGE).visible?
  end

  def Email_arleady_registered_error_message
    find(EMAIL_ERROR_MESSAGE).text
  end

  def password_error_message
    find(PASSWORD_ERROR_MESSAGE).visible?
  end

  def postcode_error_message
    find(POSTCODE_ERROR_MESSAGE).visible?
  end

  def gender_error_message
    find(GENDER_ERROR_MESSAGE).visible?
  end

  def opt_error_message
    find(OPT_IN_ERROR_MESSAGE).visible?
  end


end
