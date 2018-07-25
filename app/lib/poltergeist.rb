require 'capybara/selenium/driver'
require 'capybara/rails'
require 'selenium/webdriver'

module Poltergeist
  include Capybara::DSL

  Capybara.register_driver :selenium_chrome_headless do |app|
    browser_options = ::Selenium::WebDriver::Chrome::Options.new
    browser_options.args << '--headless'
    browser_options.args << '--disable-gpu'
    Capybara::Selenium::Driver.new(app, browser: :chrome, options: browser_options)
  end

  Capybara.javascript_driver = :selenium_chrome_headless
  Capybara.run_server = false
  Capybara.default_driver = :selenium_chrome_headless
  Capybara.threadsafe = true
  Capybara.default_max_wait_time = 180
end