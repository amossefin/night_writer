require './lib/translator'

handle = File.open(ARGV[0], "r")

incoming_text = handle.read.chomp
text_writer = TextWriter.new(incoming_text)

handle.close

translated_text = text_writer.translated_text

writer.File.open(ARGV[1], "w")

writer.write(translated_text)

writer.close

# class FileReader
#   def read
#     text_file_array = []
#     filename = ARGV[0]
#     File.open(filename, "r").each { |letter| letters_array << letter.chomp.split("") }
#     letters_array
#   end
#
# end
