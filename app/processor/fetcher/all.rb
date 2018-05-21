class Fetcher::All
  ALL_FETCHERS = [
      PornHubVideo,
      PornHubPlaylist,
      HomeMoviesTubeVideo,
      XHamsterVideo,
      XVideosVideo,
      JavForMeVideo,
      RedTubeVideo,
      YouPornVideo,
      MotherlessVideo,
      GenericPage
  ].freeze

  def self.load(url)
    ALL_FETCHERS.each do |fetcher|
      next unless fetcher.match?(url)
      return fetcher.load(url)
    end

    nil
  end
end