require 'rails_helper'

describe Fetcher::YouPornVideo do
  describe 'correct URL' do
    let(:url) { 'http://www.youporn.com/watch/10460677/girlfriend-facial-in-public-bathroom/' }

    it 'matches the url' do
      expect(Fetcher::YouPornVideo.match?(url)).to be(true)
    end

    it 'loads the right data' do
      video_data = Fetcher::YouPornVideo.load(url)
      expect(video_data.url).to eq(url)
      expect(video_data.title).to eq('Girlfriend Facial in Public Bathroom')
    end
  end

  describe 'incorrect URL' do
    describe 'other host' do
      let(:url) { 'http://xhamster.com/movies/1382314/riding_korean_gf_in_the_mouth.html' }
      it 'does not match the url' do
        expect(Fetcher::YouPornVideo.match?(url)).to be(false)
      end
    end
  end
end
