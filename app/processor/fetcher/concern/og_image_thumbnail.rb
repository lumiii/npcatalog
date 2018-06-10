module Fetcher::Concern::OGImageThumbnail
  extend ActiveSupport::Concern

  include Fetcher::Concern::ThumbnailURL

  module ClassMethods
    private
    def thumbnail_url
      Capybara.page.find('meta[property="og:image"]', visible: false)['content']
    end
  end
end