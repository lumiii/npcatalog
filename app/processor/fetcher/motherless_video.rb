class Fetcher::MotherlessVideo < Fetcher::Base
  include Fetcher::DeletableVideoData

  @@regexp = /.*motherless\.com\/.*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private

  def self.deleted
    search_params = [
        Fetcher::SelectorText.new(
            selector: '.error-page .gold',
            text: "The upload you're looking for has been deleted for the following reason"),
        Fetcher::SelectorText.new(
            selector: '.error-page h1',
            text: "404 - Not Found")
    ]

    multiple_text_search(search_params)
  end

  def self.title
    text_from_selector('#view-upload-title')
  end
end
