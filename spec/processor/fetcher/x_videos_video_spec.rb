require 'rails_helper'

describe Fetcher::XVideosVideo do
  describe 'correct URL' do
    let(:url) { 'http://www.xvideos.com/video23266679/asian_leili_koshi_fucked_to_orgasm' }

    it 'matches the url' do
      expect(Fetcher::XVideosVideo.match?(url)).to be(true)
    end

    it 'loads the right data' do
      video_data = Fetcher::XVideosVideo.load(url)
      expect(video_data.url).to eq(url)
      expect(video_data.title).to eq('Asian Leili Koshi fucked to orgasm 24 min')
    end
  end

  describe 'incorrect URL' do
    describe 'other host' do
      let(:url) { 'http://xhamster.com/movies/1382314/riding_korean_gf_in_the_mouth.html' }
      it 'does not match the url' do
        expect(Fetcher::XVideosVideo.match?(url)).to be(false)
      end
    end
  end
end
