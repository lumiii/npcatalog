class Fetcher::XVideosVideo < Fetcher::Base
  include Fetcher::DeletableVideoData
  @@regexp = /.*xvideos\.com\/video(\d)*\/.*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    text_from_selector('h2.page-title')
  end

  def self.deleted
    search_params = [
        Fetcher::SelectorText.new(
            selector: '#content h1',
            text: 'Sorry but the page you requested was not found.'),
        Fetcher::SelectorText.new(
            selector: 'h1.text-danger',
            text: 'Sorry, this video has been deleted')
    ]

    multiple_text_search(search_params)
  rescue Capybara::ElementNotFound => e
    raise e unless Capybara.page.current_url == 'https://www.xvideos.com/'
    true
  end
end
