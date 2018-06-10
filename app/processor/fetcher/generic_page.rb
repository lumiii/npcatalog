class Fetcher::GenericPage < Fetcher::Base
  include Fetcher::Concern::NormalVideoData
  include Fetcher::Concern::ScreenshotThumbnail

  @@regexp = URI.regexp

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    Capybara.page.title
  end
end