class FileLoader
  def self.load_urls(file_path)
    output = []
    dead_links = []

    File.open(file_path, 'r') do |read_file|
      read_file.each_line do |line|
        puts line
        data = load_url(line)

        if data != nil
          output.push(data)
        else
          dead_links.push(line)
        end
      end
    end

    print_dead_links(dead_links)
    print_output(output)

    puts dead_links.size
    puts output.size
    output
  end

  private
  def self.print_dead_links(dead_links)
    File.open('D:\\dead_links.txt', 'w') do |f|
      dead_links.each do |link|
        f.write(link + '\r\n')
      end
    end
  end

  def self.print_output(output)
    File.open('D:\\test.txt', 'w') do |write_file|
      output.each do |video_data|
        write_file.write(video_data.title + '\r\n' + video_data.url + '\r\n\r\n')
      end
    end
  end

  def self.load_url(url)
    Fetcher::All.load(url.strip)
  rescue Fetcher::DeletedError
    nil
  end
end