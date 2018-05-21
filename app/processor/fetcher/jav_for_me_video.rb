class Fetcher::JavForMeVideo < Fetcher::Base
  include Fetcher::NormalVideoData
  @@regexp = /.*javfor\.me\/\d*.html/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    text_from_selector('div.post > h2')
  end
end