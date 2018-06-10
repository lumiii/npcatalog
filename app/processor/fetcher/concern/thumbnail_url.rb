module Fetcher::Concern::ThumbnailURL
  extend ActiveSupport::Concern

  module ClassMethods
    private
    def thumbnail
      response = HTTParty.get(thumbnail_url)
      return nil unless response.code == 200
      response.body
    end
  end
end