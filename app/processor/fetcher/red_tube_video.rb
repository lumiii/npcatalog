class Fetcher::RedTubeVideo < Fetcher::Base
  @@regexp = /.*redtube\.com\/\d*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    Capybara.page.find('h1.video_title_text').text
  end
end
