class Fetcher::HomeMoviesTubeVideo < Fetcher::Base
  include Fetcher::Concern::DeletableVideoData
  include Fetcher::Concern::OGImageThumbnail

  @@regexp = /.*homemoviestube\.com\/videos\/\d*\/.*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    text_from_selector('#video-page h1')
  end

  def self.deleted
    search_params = [
        Fetcher::SelectorText.new(
            selector: 'h2',
            text: "Sorry, this page doesn't exist.")
    ]

    multiple_text_search(search_params)
  end

  def self.thumbnail_url
    url = Capybara.page.find('meta[property="og:image"]', visible: false)['content']
    return url if Fetcher::HomeMoviesTubeVideo.valid_url(url)

    url['b.jpg'] = '.jpg'
    return url if Fetcher::HomeMoviesTubeVideo.valid_url(url)

    nil
  end

  def self.valid_url(url)
    response = HTTParty.get(url)
    response.code == 200
  end
end