class Fetcher::YouPornVideo < Fetcher::Base
  include Fetcher::Concern::DeletableVideoData
  include Fetcher::Concern::OGImageThumbnail

  @@regexp = /.*youporn\.com\/watch\/\d*.*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    text_from_selector('.watchVideoTitle h1')
  end

  def self.deleted
    search_params = [
        Fetcher::SelectorText.new(
            selector: '.video-not-found-header',
            text: 'This video is no longer available due to a copyright claim.')
    ]

    multiple_text_search(search_params)
  rescue Capybara::ElementNotFound
    WrappedFinder.find(Capybara.page ,'.box-404') != nil
  end
end