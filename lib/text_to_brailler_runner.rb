require './lib/translator'

handle = File.open(ARGV[0], "r")

incoming_text = handle.read.chomp
braille_writer = BrailleWriter.new(incoming_text)

handle.close

translated_braille = braille_writer.translate

writer = File.open(ARGV[1], "w")

writer.write(translated_braille)

writer.close

#class FileReader
# def read
#   text_file_array = []
#   filename = ARGV[0]
#   File.open(filename, "r").each { |letter| letters_array << letter.chomp.split("") }
#   letters_array

#loud = File.open(ARGV[1], 'w')
  #loud.write(loud_quotes)
#message.write(new_message)
  #loud = File.open(ARGV[1], 'w')
#File.open(ARGV[1], 'w')
  #loud.write(new_message)
#write(new_message)

#end

# incoming_text #=> "This is really cool"
# instantiate: t_to_b = TextToBraille.new(incoming_text) class and pass it incoming_text
# once you call translate on your class instantiation formatted_txt_arr = t_to_b.translate.join("\n") #=> "000....\n..00 etc."
# This could look like #=> ['000....', '..00...', '0.0.0.0.0']
