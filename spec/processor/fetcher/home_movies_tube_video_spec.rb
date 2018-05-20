require 'rails_helper'

describe Fetcher::HomeMoviesTubeVideo do
  describe 'correct URL' do
    let(:url) { 'http://www.homemoviestube.com/videos/354954/perfect-curvy-girl-begs-for-a-facial.html' }

    it 'matches the url' do
      expect(Fetcher::HomeMoviesTubeVideo.match?(url)).to be(true)
    end

    it 'loads the right data' do
      video_data = Fetcher::HomeMoviesTubeVideo.load(url)
      expect(video_data.url).to eq(url)
      expect(video_data.title).to eq('Perfect curvy girl begs for a facial')
    end
  end

  describe 'incorrect URL' do
    describe 'other host' do
      let(:url) { 'http://www.xvideos.com/video16961879/asian_girl_sucking_a_dick_in_a_public_park' }
      it 'does not match the url' do
        expect(Fetcher::HomeMoviesTubeVideo.match?(url)).to be(false)
      end
    end
  end
end
