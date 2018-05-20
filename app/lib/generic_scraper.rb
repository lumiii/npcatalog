class GenericScraper
  include Poltergeist

  GenericData = Struct.new(:url, :title)

  def initialize(url)
    @url = url
    @data = load
  end

  def loaded
    !@data.nil?
  end

  def data
    @data
  end

  def download_thumbnail(folder)
    Capybara.visit(@url)

    folder_path = Pathname.new(folder)
    file_name = 'thumbnail' + thumbnail_extension
    local_path = folder_path.join(file_name)

    page.save_screenshot(local_path)
  end

  def thumbnail_extension
    'png'
  end

  private

  def load
    Capybara.visit(@url)
    GenericData.new(@url, page.title)
  end
end