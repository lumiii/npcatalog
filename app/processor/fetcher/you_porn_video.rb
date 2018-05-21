class Fetcher::YouPornVideo < Fetcher::Base
  include Fetcher::DeletableVideoData
  @@regexp = /.*youporn\.com\/watch\/\d*.*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    text_from_selector('.watchVideoTitle h1')
  end

  def self.deleted
    deleted_from_selector('.video-not-found-header',
                          'This video is no longer available due to a copyright claim.')
  end
end