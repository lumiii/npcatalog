class FileLoader
  def self.load_urls(file_path)
    output = []
    dead_links = []
    resume_point = 0

    lines = File.readlines(file_path)
    lines.each_with_index do |line, index|
      next if index < resume_point

      puts index.to_s + ' / ' + lines.size.to_s
      puts line
      data = load_url(line)

      if data != nil
        output.push(data)
      else
        puts 'Deleted'
        dead_links.push(line)
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
        next if link.strip == ''
        f.write(link + "\r\n")
      end
    end
  end

  def self.print_output(output)
    File.open('D:\\test.txt', 'w') do |f|
      output.each do |video_data|
        f.write(video_data.title + "\r\n" + video_data.url + "\r\n\r\n")
      end
    end
  end

  def self.load_url(url)
  Fetcher.All.load(url.strip)

  rescue Fetcher::DeletedError
    nil
  end
end