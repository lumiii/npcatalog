class Fetcher::RedTubeVideo < Fetcher::Base
  include Fetcher::Concern::NormalVideoData
  include Fetcher::Concern::OGImageThumbnail

  @@regexp = /.*redtube\.com\/\d*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    text_from_selector('h1.video_title_text')
  end
end
