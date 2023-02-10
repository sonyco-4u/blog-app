require 'test_helper'

WINDOWS_HOST = `cat /etc/resolv.conf | grep nameserver | awk '{ print $2 }'`.strip
CHROMEDRIVER_URL = "http://#{WINDOWS_HOST}:9515/"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  driven_by :selenium, using: :chrome, screen_size: [1400, 1400]

  # require "selenium-webdriver"

  # Capybara.register_driver :chrome do |app|
  #   Capybara::Selenium::Driver.new(app, browser: :chrome)
  # end

  # Capybara.javascript_driver = :chrome


Capybara.register_driver :selenium_remote_chrome do |app|
  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--start-maximized')

  Capybara::Selenium::Driver.new(
    app,
    browser: :remote,
    url: CHROMEDRIVER_URL
  )
end

Capybara.configure do |config|
  # Match what's set for URL options in test.rb so we
  # can test mailers that contain links.
  config.server_host = 'localhost'
  config.server_port = '3000'
  end


end