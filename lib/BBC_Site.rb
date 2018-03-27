require_relative 'pages/bbc_homepage'
require_relative 'pages/bbc_sign_in_page'
require_relative 'pages/bbc_account_page'
require_relative 'pages/bbc_register_page'

class BBC_Site

  def bbc_homepage
    BBC_Homepage.new
  end

  def bbc_sign_in_page
    BBC_Sign_In.new
  end

  def bbc_account_page
    BBC_Account.new
  end

  def bbc_register_page
    BBC_Register.new
  end
end
