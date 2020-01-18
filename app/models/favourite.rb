class Favourite < ApplicationRecord
  def self.create_from_video_data(video_data, id=nil)
    return nil unless Favourite.find_by_uri(video_data.url).nil?

    favourite = Favourite.new(
      uri: video_data.url,
      title: video_data.title,
      likes: 1,
    )

    favourite.id = id unless id.nil?
    raise 'No thumbnail' if video_data.thumbnail.nil?

    favourite.save!
    favourite.save_thumbnail(video_data.thumbnail)
    favourite
  end

  def thumbnail_path
    File.join(media_folder_name, 'thumbnail.jpg')
  end

  def save_thumbnail(thumbnail)
    ensure_folder
    thumbnail_path = local_thumbnail_path
    File.open(thumbnail_path, 'wb:ASCII-8BIT') do |f|
      f.write(thumbnail)
    end
  end

  def delete
    delete_folder
    super
  end

  def destroy
    delete_folder
    super
  end

  def increment_likes
    new_likes = likes + 1
    update!(likes: new_likes)
  end

  private
  def local_thumbnail_path
    File.join(Rails.configuration.media_path, thumbnail_path)
  end

  def ensure_folder
    dirname = File.dirname(local_thumbnail_path)
    FileUtils.mkdir_p(dirname) unless File.exist?(dirname)
  end

  def delete_folder
    dirname = File.dirname(local_thumbnail_path)
    FileUtils.remove_dir(dirname)
  end

  def media_folder_name
    id.to_s + '-' + folder_friendly_title
  end

  def folder_friendly_title
    friendly_title = title.strip.downcase
    friendly_title = friendly_title.gsub(/#|\.|\\|\s|\/|\?|\*|\||\>|\<|\:|\;/, '_')

    friendly_title = friendly_title[0..99] if friendly_title.length > 100
    friendly_title
  end
end
