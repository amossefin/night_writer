#
#print "What would you like to convert?: "

#input = gets.chomp

require 'pry'


class Braille

    attr_accessor :message, :letter_library, :internal_message

    def initialize
        @counter = 0
        @message = File.open(ARGV[0], "r").read.chomp
        @letter_library = {"a" => ["0.","..",".."], "b" => ["0.","0.",".."], "c" => ["00","..",".."], "d" => ["00",".0",".."],
        "e" => ["0.",".0",".."], "f" => ["00","0.",".."], "g" => ["00","00",".."], "h" => ["0.","00",".."],
        "i" => [".0","0.",".."], "j" => [".0","00",".."], "k" => ["0.","..","0."], "l" => ["0.","0.","0."],
        "m" => ["00","..","0."], "n" => ["0.",".0","0."], "o" => ["0.",".0","0."], "p" => ["00","0.","0."],
        "r" => ["0.","00","0."], "s" => [".0","0.","0."], "t" => [".0","00","0."], "u" => ["0.","..","00"],
        "v" => ["0.","0.","00"], "w" => [".0","00",".0"], "x" => ["00","..","00"], "y" => ["00",".0","00"],
        "z" => ["0.",".0","00"], "!" => ["..","00","0."], "'" => ["..","..","0."], "," => ["..","0.",".."],
        "-" => ["..","..","00"], "." => ["..","00",".0"], "?" => ["..","0.","00"], "capitals" => ["..", "..", ".0"],
        "numbers" => [".0", ".0", "00"], " " => ["..","..",".."]}
    end

    def echo
        words_txt = File.open('./message.txt', "w")
        words_txt.puts(@message)
        words_txt.puts(@message)
        words_txt.print(@message)
        @message = (message + "\n")*3
        #@message = message.split("\n")
        #@message = message[0].split(""), message[1].split(""), message[2].split("")
    end

    def message_split
        @message = message.split("\n")
        @message = message[0].split(""), message[1].split(""), message[2].split("")
    end

    def convert_to_braille
        
        braille_txt = File.open('./braille.txt', "w")

            message[0].each do |x|
                if @letter_library[x] == nil
                    cap = @letter_library["capitals"]
                    letter = @letter_library[x.downcase]
                    braille_txt.print(cap[0])
                    braille_txt.print(letter[0])
                    @counter += 1
                else
                    letter = @letter_library[x]
                    braille_txt.print(letter[0])
                    @counter += 1
                end
                #binding.pry
            #braille_txt << "\n" 
            end
        
            braille_txt.print("\n")

            message[1].each do |x|
                if @letter_library[x] == nil
                    cap = @letter_library["capitals"]
                    letter = @letter_library[x.downcase]
                    braille_txt.print(cap[1])
                    braille_txt.print(letter[1])
                    @counter += 1
                else
                    letter = @letter_library[x]
                    braille_txt.print(letter[1])
                    @counter += 1
                end
                #binding.pry
            #braille_txt << "\n" 
            end
        
            braille_txt.print("\n")
        
            message[2].each do |x|
                if @letter_library[x] == nil
                    cap = @letter_library["capitals"]
                    letter = @letter_library[x.downcase]
                    braille_txt.print(cap[2])
                    braille_txt.print(letter[2])
                    @counter += 2
                else
                    letter = @letter_library[x]
                    braille_txt.print(letter[2])
                    @counter += 1
                end
                #binding.pry
            #braille_txt << "\n" 
            end       
            
            
            
#            message.map! do |x|
#               if @letter_library[x] == nil
#                   @letter_library["capitals"] 
#                   @letter_library[x.downcase]
#               else
#                   @letter_library[x]
#              end
#        end
    end

    def  letters_to_numbers
        { "j" => "0", "a" => "1", "b" => "2", "c" => "3", "d" => "4",
        "e" => "5", "f" => "6", "g" => "7", "h" => "8", "i" => "9"}
    end

    def play_theme
        `afplay ./night_rider.wav`
    end
end

#binding.pry



message_txt = Braille.new

message_txt.echo

message_txt.message_split

message_txt.convert_to_braille

braille = File.open('./braille.txt', "r")

contents = braille.read

characters = contents.length

#binding.pry

puts "Created #{ARGV[1]} containing #{characters} characters"

message_txt.play_theme

''