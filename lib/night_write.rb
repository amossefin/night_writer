class Braille

    attr_accessor :message, :letter_library, :number_library

    def initialize
        @message = File.open(ARGV[0], "r").read.chomp
        @letter_library = {"a" => ["0.","..",".."], "b" => ["0.","0.",".."], "c" => ["00","..",".."], 
        "d" => ["00",".0",".."],"e" => ["0.",".0",".."], "f" => ["00","0.",".."], "g" => ["00","00",".."], 
        "h" => ["0.","00",".."],"i" => [".0","0.",".."], "j" => [".0","00",".."], "k" => ["0.","..","0."], 
        "l" => ["0.","0.","0."],"m" => ["00","..","0."], "n" => ["00",".0","0."], "o" => ["0.",".0","0."], 
        "p" => ["00","0.","0."],"q" => ["00","00","0."], "r" => ["0.","00","0."], "s" => [".0","0.","0."], 
        "t" => [".0","00","0."], "u" => ["0.","..","00"],"v" => ["0.","0.","00"], "w" => [".0","00",".0"], 
        "x" => ["00","..","00"], "y" => ["00",".0","00"],"z" => ["0.",".0","00"], "!" => ["..","00","0."], 
        "'" => ["..","..","0."], "," => ["..","0.",".."],"-" => ["..","..","00"], "." => ["..","00",".0"], 
        "?" => ["..","0.","00"], "capitals" => ["..", "..", ".0"],"numbers" => [".0", ".0", "00"], 
        " " => ["..","..",".."]}
        @number_library = {"0"=>"j", "1"=>"a", "2"=>"b", "3"=>"c", "4"=>"d", "5"=>"e", "6"=>"f", "7"=>"g", "8"=>"h", "9"=>"i"}
    end

    def echo
        words_txt = File.open(ARGV[0], "w")
        words_txt.puts(@message)
        words_txt.puts(@message)
        words_txt.print(@message)
        @message = (message + "\n")*3
    end

    def convert_to_braille

        @message = message.split("\n")
        @message = message[0].split(""), message[1].split(""), message[2].split("")
        
        braille_txt = File.open(ARGV[1], "w")

            @message[0].each do |x|
                if @letter_library[x] == nil
                    cap = @letter_library["capitals"]
                    letter = @letter_library[x.downcase]
                    braille_txt.print(cap[0])
                    braille_txt.print(letter[0])
                else
                    letter = @letter_library[x]
                    braille_txt.print(letter[0])
                end
            end
        
            braille_txt.print("\n")

            @message[1].each do |x|
                if @letter_library[x] == nil
                    cap = @letter_library["capitals"]
                    letter = @letter_library[x.downcase]
                    braille_txt.print(cap[1])
                    braille_txt.print(letter[1])
                else
                    letter = @letter_library[x]
                    braille_txt.print(letter[1])
                end          
            end
        
            braille_txt.print("\n")
        
            @message[2].each do |x|
                if @letter_library[x] == nil
                    cap = @letter_library["capitals"]
                    letter = @letter_library[x.downcase]
                    braille_txt.print(cap[2])
                    braille_txt.print(letter[2])
                else
                    letter = @letter_library[x]
                    braille_txt.print(letter[2])
                end
            end       
            
            braille_txt.close
            
    end
    

    def play_theme
        `afplay ./night_rider.wav`
    end

    def roll_credits
        puts "Created '#{ARGV[1]}' containing #{File.open(ARGV[1], "r").read.size} characters"
    end

end


message_txt = Braille.new

message_txt.echo

message_txt.convert_to_braille

message_txt.roll_credits

message_txt.play_theme