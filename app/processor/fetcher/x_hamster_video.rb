class Fetcher::XHamsterVideo < Fetcher::Base
  @@regexp = /.*xhamster\.com\/(videos|movies)\/.*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    Capybara.page.find('h1.entity-info-container__title').text
  end

  def self.sanitize_url(url)
    tokens = url.split('?')
    url = tokens[0]
    tokens = url.split('&')
    url = tokens[0]
    url
  end
end