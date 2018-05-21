class Fetcher::GenericPage < Fetcher::Base
  @@regexp = URI.regexp

  def self.match?(url)
    @@regexp.match(url) != nil
  end

  private

  def self.data
    Fetcher::VideoData.new(
        url: Capybara.page.current_url,
        title: title
    )
  end

  def self.title
    Capybara.page.title
  end
end