module Fetcher
  include Poltergeist

  class DeletedError < StandardError
    def initialize(msg='This resource was deleted')
      super
    end
  end

  class WrongFetcherError < StandardError
    def initialize(msg='Wrong URL for this fetcher')
      super
    end
  end

  VideoData = Struct.new(:url, :title, keyword_init: true)
  SelectorText = Struct.new(:selector, :text, keyword_init: true)
end