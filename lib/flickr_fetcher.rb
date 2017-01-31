# encoding: UTF-8
require 'flickr_fetcher/version'

require 'flickraw'
require 'HTTParty'
require 'mini_magick'

# FlickrFetcher
module FlickrFetcher

FlickRaw.api_key = '0b0c61acdc433e29509fac37df272b25'
FlickRaw.shared_secret = '7930a005541b1bfa'

def FlickrFetcher.fetch_image(tag)
  begin
    puts "Looking for keyword: #{tag}"
    result = flickr.photos.search tags: tag, sort: 'interestingness-desc'
    if result.size.zero?
      puts "Image for keyword '#{tag}' not found"
      tag = get_random_keywords(1)[0]
    end
  end until result.size.nonzero?

  info = flickr.photos.getInfo(photo_id: result.first.id)
  # puts FlickRaw.url(info)
  # puts FlickRaw.url_q(info)
  # HTTParty.get(FlickRaw.url_q(info))
  HTTParty.get(FlickRaw.url(info))
rescue Exception => e
  # rescue FlickRaw::FailedResponse => e
  puts "Catching the errors: #{e.inspect}"
end

def FlickrFetcher.save_image(img_data, tag)
  File.open(tag + '.image', 'wb') do |f|
    f.write img_data
  end
end

# Crop the the image if its not a rectangle
def FlickrFetcher.crop_image(tag)
  image = MiniMagick::Image.new(tag + '.image')

  if image.width == image.height
    image.crop "#{image.width}x#{(image.height / 2).round}+0+0"
  end
end

def FlickrFetcher.create_collage(filename)
  # montage -density 500 -tile 3x0 -geometry +10+20 -border 5 *.png out.png
  montage = MiniMagick::Tool::Montage.new
  montage.density '600'
  montage.tile '3x0'
  montage.geometry '+10+20'
  montage.border '5'
  montage << '*.image'
  montage << filename
  montage.call
end

# Creates an array of random words taken from the /usr/share/dict/words file
def FlickrFetcher.get_random_keywords(number_of_words)
  dictionary = '/usr/share/dict/words'
  raise "Dictionary file #{dictionary} doesn't exist" unless File.exist? dictionary
  f = File.open(dictionary, 'r')
  keywords = f.readlines
  words = []
  number_of_words.times do
    index = rand(0..keywords.size)
    words << keywords[index].strip
  end
  words
end


def FlickrFetcher.setup
  filename = 'collage'

  filename = ARGV.pop unless ARGV.empty?
  filename += '.jpg'

  tags = []
  ARGV.size.times do
    tags << ARGV.shift
  end

  File.delete filename if File.exist? filename
  Dir.glob('*.image') { |filen| File.delete filen }

  tags << FlickrFetcher.get_random_keywords(10 - tags.size) if tags.size < 10
  tags.flatten!
  puts "Using keywords #{tags}"
  return tags, filename
end

def FlickrFetcher.search
  tags, filename = FlickrFetcher.setup

  tags.each do |tag|
    response = FlickrFetcher.fetch_image(tag)
    if response.nil?
      puts "Was not possible to fetch the image for the keyword: #{tag}"
    else
      FlickrFetcher.save_image(response.parsed_response, tag)
      FlickrFetcher.crop_image(tag)
    end
  end

  if Dir.glob('*.image').empty?
    puts 'Error: There are not images to create the Collage.'
  else
    FlickrFetcher.create_collage(filename)
    puts "Image collage filename: #{filename}"
  end
end

end
