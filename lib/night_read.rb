class OriginalMessage

    attr_accessor :braille, :letter_library

    def initialize
        @braille = File.open(ARGV[0], "r").read
       @letter_library = {"a" => ["0.","..",".."], "b" => ["0.","0.",".."], "c" => ["00","..",".."], 
        "d" => ["00",".0",".."],"e" => ["0.",".0",".."], "f" => ["00","0.",".."], "g" => ["00","00",".."], 
        "h" => ["0.","00",".."],"i" => [".0","0.",".."], "j" => [".0","00",".."], "k" => ["0.","..","0."], 
        "l" => ["0.","0.","0."],"m" => ["00","..","0."], "n" => ["00",".0","0."], "o" => ["0.",".0","0."], 
        "p" => ["00","0.","0."],"q" => ["00","00","0."], "r" => ["0.","00","0."], "s" => [".0","0.","0."], 
        "t" => [".0","00","0."],"u" => ["0.","..","00"], "v" => ["0.","0.","00"], "w" => [".0","00",".0"], 
        "x" => ["00","..","00"],"y" => ["00",".0","00"], "z" => ["0.",".0","00"], "!" => ["..","00","0."], 
        "'" => ["..","..","0."],"," => ["..","0.",".."], "-" => ["..","..","00"], "." => ["..","00",".0"], 
        "?" => ["..","0.","00"], "capitals" => ["..", "..", ".0"],"numbers" => [".0", ".0", "00"], 
        " " => ["..","..",".."]}
    end

    def convert_to_message
       
        @braille = braille.split("\n")
        original = File.open(ARGV[1], "w")
        count = 0
        length = (@braille[0].size)-1
        @letter_library = @letter_library.invert
        converted = []
        
        @braille.map! do |line|
            line.scan(/../)
        end
        
        while count <= length
           converted << [@braille[0][count], @braille[1][count], @braille[2][count]]
           count += 1
        end

        converted.each_with_index do |x, index|
           if converted[index - 1] == ["..", "..", ".0"]
               cap = @letter_library[x].to_s.upcase
               original.print(cap)
            elsif @letter_library[x] == "capitals"
                next
            else
                original.print(@letter_library[x])
            end
        end
    end
end

original_message = OriginalMessage.new

original_message.convert_to_message
