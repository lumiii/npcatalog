require 'rails_helper'

describe Fetcher::JavForMeVideo do
  describe 'correct URL' do
    let(:url) { 'http://javfor.me/103751.html' }

    it 'matches the url' do
      expect(Fetcher::JavForMeVideo.match?(url)).to be(true)
    end

    it 'loads the right data' do
      video_data = Fetcher::JavForMeVideo.load(url)
      expect(video_data.url).to eq(url)
      expect(video_data.title).to eq('[WSP119] Hot Girl Corrupted With Just One Fuck')
    end
  end

  describe 'incorrect URL' do
    describe 'other host' do
      let(:url) { 'http://www.xvideos.com/video16961879/asian_girl_sucking_a_dick_in_a_public_park' }
      it 'does not match the url' do
        expect(Fetcher::JavForMeVideo.match?(url)).to be(false)
      end
    end
  end
end
