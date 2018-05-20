require 'rails_helper'

describe Fetcher::XHamsterVideo do
  describe 'correct URL' do
    let(:url) { 'https://xhamster.com/videos/amateur-facial-beautiful-eyes-2514759&from=player_related' }

    it 'matches the url' do
      expect(Fetcher::XHamsterVideo.match?(url)).to be(true)
    end

    it 'loads the right data' do
      video_data = Fetcher::XHamsterVideo.load(url)
      expect(video_data.url).to eq('https://xhamster.com/videos/amateur-facial-beautiful-eyes-2514759')
      expect(video_data.title).to eq('amateur facial.... beautiful eyes')
    end
  end

  describe 'incorrect URL' do
    describe 'other host' do
      let(:url) { 'http://www.xvideos.com/video16961879/asian_girl_sucking_a_dick_in_a_public_park' }
      it 'does not match the url' do
        expect(Fetcher::XHamsterVideo.match?(url)).to be(false)
      end
    end
  end
end
