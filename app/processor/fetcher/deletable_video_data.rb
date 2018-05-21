module Fetcher::DeletableVideoData
  extend ActiveSupport::Concern

  module ClassMethods
    private
    def data
      Fetcher::VideoData.new(
          url: Capybara.page.current_url,
          title: title
      )
    rescue Capybara::ElementNotFound
      raise Fetcher::DeletedError.new if deleted
    end
  end
end