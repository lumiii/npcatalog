class WrappedFinder
  def self.find(session, *args, **options, &optional_filter_block)
    puts "Finding selectors in #{session.current_url}"
    session.find(*args, **options, &optional_filter_block)
  rescue StandardError => e
      puts "Failed to find selector"
      puts args
      puts e
      raise
  end
end

