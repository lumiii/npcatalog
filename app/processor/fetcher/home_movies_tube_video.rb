class Fetcher::HomeMoviesTubeVideo < Fetcher::Base
  @@regexp = /.*homemoviestube\.com\/videos\/\d*\/.*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    Capybara.page.find('#video-page h1').text
  end
end