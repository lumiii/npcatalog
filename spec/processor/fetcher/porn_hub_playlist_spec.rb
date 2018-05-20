require 'rails_helper'

describe Fetcher::PornHubPlaylist do
  describe 'correct URL' do
    let(:url) { 'https://www.pornhub.com/playlist/12582271' }

    it 'matches the url' do
      expect(Fetcher::PornHubPlaylist.match?(url)).to be(true)
    end

    it 'loads the right data' do
      video_data = Fetcher::PornHubPlaylist.load(url)
      expect(video_data.url).to eq(url)
      expect(video_data.title).to eq("Kara's Feet 89%")
    end
  end

  describe 'incorrect URL' do
    describe 'other host' do
      let(:url) { 'http://xhamster.com/movies/1382314/riding_korean_gf_in_the_mouth.html' }
      it 'does not match the url' do
        expect(Fetcher::PornHubPlaylist.match?(url)).to be(false)
      end
    end
  end
end
