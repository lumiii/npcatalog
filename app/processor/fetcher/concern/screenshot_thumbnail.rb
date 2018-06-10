module Fetcher::Concern::ScreenshotThumbnail
  extend ActiveSupport::Concern

  module ClassMethods
    private
    def thumbnail
      Capybara.page.save_screenshot(temp_filename)
      thumbnail = File.binread(temp_filename)
      File.delete(temp_filename)
      thumbnail
    end

    def temp_filename
      File.join(Rails.configuration.media_path, 'temp', 'thumbnail.jpg')
    end
  end
end