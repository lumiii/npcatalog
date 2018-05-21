class Fetcher::PornHubPlaylist < Fetcher::Base
  @@regexp = /.*pornhub\.com\/playlist\/.*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.data
    Fetcher::VideoData.new(
        url: Capybara.page.current_url,
        title: title
    )
  end

  def self.title
    text_from_selector('#playlistTopHeader h1')
  end
end