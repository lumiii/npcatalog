module Fetcher
  class Base
    def self.load(url)
      throw Fetcher::WrongFetcherError unless match?(url)
      url = sanitize_url(url)
      Capybara.reset!
      Capybara.visit(url)
      data
    end

    private
    def self.sanitize_url(url)
      url
    end

    def self.text_from_selector(selector)
      Capybara.page.find(selector, wait:20).text
    end
  end
end