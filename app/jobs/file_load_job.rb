class FileLoadJob < ApplicationJob
  queue_as :default

  def perform
    # load_urls(Rails.configuration.text_file_path)
    load_urls('C:\\Users\\Vincent\\OneDrive\\links.txt')
  end

  def load_urls(file_path)
    lines = File.readlines(file_path)
    lines.each_with_index do |line, index|
      puts index.to_s + ' / ' + lines.size.to_s
      puts line
      # id, url = decompose_line(line)
      # data = load_url(url)
      data = load_url(line.strip)

      # Favourite.create_from_video_data(data, id) if data != nil
      Favourite.create_from_video_data(data) if data != nil
    end
  end

  private
  def decompose_line(line)
    chunks = line.split("\t")
    return chunks[0].strip, chunks[1].strip
  end

  def load_url(url)
    Fetcher::All::load(url)
  rescue Fetcher::DeletedError
    nil
  end
end
