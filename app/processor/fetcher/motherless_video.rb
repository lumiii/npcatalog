class Fetcher::MotherlessVideo < Fetcher::Base
  include Fetcher::DeletableVideoData

  @@regexp = /.*motherless\.com\/.*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private

  def self.deleted
    deleted_from_selector('.error-page .gold',
                          "The upload you're looking for has been deleted for the following reason")
  end

  def self.title
    text_from_selector('#view-upload-title')
  end
end
