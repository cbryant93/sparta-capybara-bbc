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

  def input_email(email)
    fill_in(EMAIL, with: email)
  end

end
