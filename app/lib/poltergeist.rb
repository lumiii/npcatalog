require 'capybara/poltergeist'
require 'capybara/rails'

module Poltergeist
  include Capybara::DSL

  Capybara.current_driver = :poltergeist
  Capybara.javascript_driver = :poltergeist
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, js_errors: false, timeout: 180, logger: nil)
  end
end