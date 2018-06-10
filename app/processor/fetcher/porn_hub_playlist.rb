class Fetcher::PornHubPlaylist < Fetcher::Base
  include Fetcher::Concern::NormalVideoData
  include Fetcher::Concern::ScreenshotThumbnail

  @@regexp = /.*pornhub\.com\/playlist\/.*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    text_from_selector('#playlistTopHeader h1')
  end
end