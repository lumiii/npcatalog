class Fetcher::PornHubVideo < Fetcher::Base
  include Fetcher::DeletableVideoData

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
    deleted_from_selector('.removed .video-notice',
                          'Video has been removed at the request of the copyright owner.')
  end
end