module Fetcher
  class Base
    def self.load(url)
      throw Fetcher::WrongFetcherError unless match?(url)
      Capybara.reset!

      url = sanitize_url(url)
      uri = URI.parse(url)
      Capybara.configure do |config|
        config.run_server = false
        config.default_driver = :selenium_chrome_headless
        config.app_host = "#{uri.scheme}://#{uri.host}"
      end

      Capybara.visit(url)
      data
    end

    private
    def self.sanitize_url(url)
      url
    end

    def self.text_from_selector(selector)
      page = Capybara.page
      elem = page.find(selector, wait:20)
      elem.text
    end
  end
end