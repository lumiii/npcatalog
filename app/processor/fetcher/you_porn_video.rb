class Fetcher::YouPornVideo < Fetcher::Base
  @@regexp = /.*youporn\.com\/watch\/\d*.*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    Capybara.page.find('.watchVideoTitle h1').text
  end
end