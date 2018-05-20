class Fetcher::PornHubVideo < Fetcher::Base
  include Poltergeist

  @@regexp = /.*pornhub\.com\/view_video\.php\?viewkey=.*/

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private
  def self.title
    Capybara.page.find('h1.title').text
  end

  def self.sanitize_url(url)
    uri = URI.parse(url)
    original_params = CGI.parse(uri.query)
    sanitized_params = {'viewkey' => original_params['viewkey']}
    uri.query = URI.encode_www_form(sanitized_params)
    uri.to_s
  end
end