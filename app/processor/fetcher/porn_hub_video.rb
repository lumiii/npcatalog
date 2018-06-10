class Fetcher::PornHubVideo < Fetcher::Base
  include Fetcher::Concern::DeletableVideoData
  include Fetcher::Concern::OGImageThumbnail

  @@regexp = /.*pornhub\.com\/view_video\.php\?viewkey=.*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    text_from_selector('h1.title')
  end

  def self.sanitize_url(url)
    uri = URI.parse(url)
    original_params = CGI.parse(uri.query)
    sanitized_params = {'viewkey' => original_params['viewkey']}
    uri.query = URI.encode_www_form(sanitized_params)
    uri.to_s
  end

  def self.deleted
    search_params = [
        Fetcher::SelectorText.new(
            selector: '.removed .video-notice',
            text: /Video has been removed at the request of.*/),
        Fetcher::SelectorText.new(
            selector: '.removed .video-notice',
            text: 'This video was deleted by uploader'),
        Fetcher::SelectorText.new(
            selector: '.removed .video-notice',
            text: 'This video has been disabled'),
        Fetcher::SelectorText.new(
            selector: 'h1 > span',
            text: 'Error Page Not Found')
    ]

    multiple_text_search(search_params)
  end
end