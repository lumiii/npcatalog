require 'rails_helper'

describe Fetcher::GenericPage do
  let(:url) { 'http://yaruo.info/25265#more-25265' }

  it 'matches the url' do
    expect(Fetcher::GenericPage.match?(url)).to be(true)
  end

  it 'loads the right data' do
    video_data = Fetcher::GenericPage.load(url)
    expect(video_data.url).to eq(url)
    expect(video_data.title).to eq('素人なのに彼氏に大量に顔射された彼女のエロ画像 | 素人エロ画像やったる夫')
  end
end
