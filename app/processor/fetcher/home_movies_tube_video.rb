class Fetcher::HomeMoviesTubeVideo < Fetcher::Base
  include Fetcher::DeletableVideoData
  @@regexp = /.*homemoviestube\.com\/videos\/\d*\/.*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    text_from_selector('#video-page h1')
  end

  def self.deleted
    deleted_from_selector('h2', "Sorry, this page doesn't exist.")
  end
end