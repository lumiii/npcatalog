require 'capybara/poltergeist'
require 'capybara/rails'

module Poltergeist
  include ActiveSupport::Concern

  include Capybara::DSL
  Capybara.current_driver = :poltergeist
  Capybara.javascript_driver = :poltergeist
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, js_errors: false)
  end
end