require 'rails_helper'

describe Fetcher::MotherlessVideo do
  describe 'correct URL' do
    let(:url) { 'http://motherless.com/056288A' }

    it 'matches the url' do
      expect(Fetcher::MotherlessVideo.match?(url)).to be(true)
    end

    it 'loads the right data' do
      video_data = Fetcher::MotherlessVideo.load(url)
      expect(video_data.url).to eq(url)
      expect(video_data.title).to eq('Fuck Toy Facial Selfie')
    end
  end

  describe 'incorrect URL' do
    describe 'other host' do
      let(:url) { 'http://xhamster.com/movies/1382314/riding_korean_gf_in_the_mouth.html' }
      it 'does not match the url' do
        expect(Fetcher::MotherlessVideo.match?(url)).to be(false)
      end
    end
  end
end
