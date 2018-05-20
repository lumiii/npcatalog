module Fetcher
  class Base
    def self.load(url)
      throw 'Wrong URL' unless match?(url)
      url = sanitize_url(url)
      Capybara.visit(url)
      Fetcher::VideoData.new(url: url, title: title)
    end

    private
    def self.sanitize_url(url)
      url
    end
  end
end