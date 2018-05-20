class Fetcher::JavForMeVideo < Fetcher::Base
  @@regexp = /.*javfor\.me\/\d*.html/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    Capybara.page.find('div.post > h2').text
  end
end