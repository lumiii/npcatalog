class Fetcher::XHamsterVideo < Fetcher::Base
  include Fetcher::DeletableVideoData
  @@regexp = /.*xhamster\.com\/(videos|movies)\/.*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    text_from_selector('h1.entity-info-container__title')
  end

  def self.sanitize_url(url)
    tokens = url.split('?')
    url = tokens[0]
    tokens = url.split('&')
    url = tokens[0]
    url
  end

  def self.deleted
    search_params = [
        Fetcher::SelectorText.new(
            selector: '.error404-title',
            text: 'Video Was Deleted')
    ]

    multiple_text_search(search_params)
  rescue Capybara::ElementNotFound
    Capybara.page.find('.item-status.friends-only') != nil
  end
end