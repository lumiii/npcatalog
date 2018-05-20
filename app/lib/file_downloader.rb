require 'open-uri'

class FileDownloader
  def self.download(download_path, url)
    File.open(download_path, 'wb') do |saved_file|
      open(url, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE) do |read_file|
        saved_file.write(read_file.read)
      end
    end
  end
end

