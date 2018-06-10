class Fetcher::JavForMeVideo < Fetcher::Base
  include Fetcher::Concern::NormalVideoData
  include Fetcher::Concern::ThumbnailURL

  @@regexp = /.*javfor\.me\/\d*.html/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.thumbnail_url
    Capybara.page.find('#my_main_content_box img')['src']
  end

  def self.title
    text_from_selector('div.post > h2')
  end
end