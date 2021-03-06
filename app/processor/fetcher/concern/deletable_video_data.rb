module Fetcher::Concern::DeletableVideoData
  extend ActiveSupport::Concern

  module ClassMethods
    private
    def data
      Fetcher::VideoData.new(
          url: Capybara.page.current_url,
          title: title,
          thumbnail: thumbnail
      )
    rescue Capybara::ElementNotFound
      raise Fetcher::DeletedError.new if deleted
    end

    def multiple_text_search(selector_text_arr)
      err = nil
      selector_text_arr.each do |curr_search|
        return WrappedFinder.find(Capybara.page, curr_search.selector, text: curr_search.text)
      rescue Capybara::ElementNotFound => err
      end

      err
    end
  end
end