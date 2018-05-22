require 'rails_helper'

describe FileLoader do
  it 'loads the whole file successfully' do
    all_data = FileLoader.load_urls('C:\\Users\\Vincent\\OneDrive\\links.txt')
  end
end
