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

    def self.deleted_from_selector(selector, target_text)
      deleted_text = text_from_selector(selector)
      deleted_text == target_text
    rescue Capybara::ElementNotFound
      false
    end
  end
end