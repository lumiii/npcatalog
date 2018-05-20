module Fetcher
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
  # GenericPage
  ].freeze

  VideoData = Struct.new(:url, :title, keyword_init: true)
end