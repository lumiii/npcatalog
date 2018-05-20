class Fetcher::MotherlessVideo < Fetcher::Base
  @@regexp = /.*motherless\.com\/.*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    Capybara.page.find('#view-upload-title').text
  end
end