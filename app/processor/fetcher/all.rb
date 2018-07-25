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

      3.times do
        return fetcher.load(url)
      # rescue Capybara::Poltergeist::StatusFailError
      rescue StandardError => e
          puts e
      end
    end

    nil
  end
end