module Fetcher::NormalVideoData
  extend ActiveSupport::Concern

  module ClassMethods
    private
    def data
      Fetcher::VideoData.new(
          url: Capybara.page.current_url,
          title: title
      )
    end
  end
end