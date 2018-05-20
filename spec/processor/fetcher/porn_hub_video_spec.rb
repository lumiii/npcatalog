require 'rails_helper'

describe Fetcher::PornHubVideo do
  describe 'correct URL' do
    let(:url) { 'https://www.pornhub.com/view_video.php?viewkey=87492788&pkey=12160371' }

    it 'matches the url' do
      expect(Fetcher::PornHubVideo.match?(url)).to be(true)
    end

    it 'loads the right data' do
      video_data = Fetcher::PornHubVideo.load(url)
      expect(video_data.url).to eq('https://www.pornhub.com/view_video.php?viewkey=87492788')
      expect(video_data.title).to eq('AYISA BLOWJOB FACIAL')
    end
  end

  describe 'incorrect URL' do
    describe 'other host' do
      let(:url) { 'http://www.xvideos.com/video16961879/asian_girl_sucking_a_dick_in_a_public_park' }
      it 'does not match the url' do
        expect(Fetcher::PornHubVideo.match?(url)).to be(false)
      end
    end

    describe 'playlist' do
      let(:url) { 'http://www.pornhub.com/playlist/12582271' }
      it 'does not match the url' do
        expect(Fetcher::PornHubVideo.match?(url)).to be(false)
      end
    end
  end
end
