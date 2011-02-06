Paperclip.options[:image_magick_path] = "C:/Program Files/ImageMagick-6.6.6-Q16"
=begin
def quote_command_options(*options) 
	options.map do |option| 
	option.split("'").map{|m| "#{m}" }.join("\\'") #removed single quotes around #{m} 
end 

=end