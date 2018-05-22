class LoadLinksFile
  def self.load(file_path)
    favourites_data = FileLoader.load_urls(file_path)
    favourites_data.each do |data|
      Favourite.create!(
        uri: data.url,
        title: data.title
      )
    end
  end
end