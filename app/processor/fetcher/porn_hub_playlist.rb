class Fetcher::PornHubPlaylist < Fetcher::Base
  @@regexp = /.*pornhub\.com\/playlist\/.*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    Capybara.page.find('#playlistTopHeader h1').text
  end
end