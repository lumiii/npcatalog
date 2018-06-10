class FileDumpJob < ApplicationJob
  queue_as :default

  def perform(*args)
    File.open(Rails.configuration.text_file_path, 'w') do |f|
      Favourite.all.each do |favourite|
        f.write(favourite.id.to_s + "\t" + favourite.uri + "\r\n")
      end
    end
  end
end
