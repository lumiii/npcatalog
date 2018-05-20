require 'rails_helper'

describe Fetcher::RedTubeVideo do
  describe 'correct URL' do
    let(:url) { 'http://www.redtube.com/547881' }

    it 'matches the url' do
      expect(Fetcher::RedTubeVideo.match?(url)).to be(true)
    end

    it 'loads the right data' do
      video_data = Fetcher::RedTubeVideo.load(url)
      expect(video_data.url).to eq(url)
      expect(video_data.title).to eq('Hot Asian Takes A Huge Load In Her Mouth')
    end
  end

  describe 'incorrect URL' do
    describe 'other host' do
      let(:url) { 'http://www.xvideos.com/video16961879/asian_girl_sucking_a_dick_in_a_public_park' }
      it 'does not match the url' do
        expect(Fetcher::RedTubeVideo.match?(url)).to be(false)
      end
    end
  end
end
