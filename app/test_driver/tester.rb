class Tester
  def self.test(file_path)
    File.open(file_path, 'r') do |f|
      f.each_line do |line|
        next if !Fetcher::GenericPage.match?(line) || line.strip == ''
        data = GenericScraper.new(line).data
        puts data.url, data.title
      end
    end
  end

  def self.line_match(line)
    Fetcher::ALL_FETCHERS.each do |fetcher|
      return true if fetcher.match?(line)
    end

    false
  end
end