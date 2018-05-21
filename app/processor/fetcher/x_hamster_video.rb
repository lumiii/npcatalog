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
    deleted_from_selector('error404-title', 'Video was deleted')
  end
end