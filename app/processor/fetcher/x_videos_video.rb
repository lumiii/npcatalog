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
    deleted_from_selector('h1.text-danger',
                          'Sorry, this video has been deleted')
  end
end
