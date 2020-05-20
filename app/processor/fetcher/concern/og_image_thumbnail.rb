module Fetcher::Concern::OGImageThumbnail
  extend ActiveSupport::Concern

  include Fetcher::Concern::ThumbnailURL

  module ClassMethods
    private
    def thumbnail_url
      meta_tag = WrappedFinder.find(Capybara.page, 'meta[property="og:image"]', visible: false, match: :first)
      meta_tag['content']
    end
  end
end