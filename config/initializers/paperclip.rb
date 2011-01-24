#Paperclip.options[:image_magick_path] = "/home/daze/Documents/Install/ImageMagick-6.6.7-0"
=begin
def quote_command_options(*options) 
	options.map do |option| 
	option.split("'").map{|m| "#{m}" }.join("\\'") #removed single quotes around #{m} 
end 
=end
