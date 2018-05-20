class Fetcher::XVideosVideo < Fetcher::Base
  @@regexp = /.*xvideos\.com\/video(\d)*\/.*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    Capybara.page.find('h2.page-title').text
  end
end
