
require 'minitest/autorun'
require 'minitest/pride'
require './lib/braille_runner'
class BrailleRunnerTest < Minitest::Test
  def test_it_exist
    braille_runner = BrailleRunner.new
    assert_instance_of BrailleRunner, braille_runner
  end
  def test_it_has_three_outputs
    braille_runner = BrailleRunner.new
    assert_equal 3, braille_runner.count
  end
  def test_there_a_library
    braille_runner = BrailleRunner.new
    assert_equal {"a" => ["0.","..",".."], "b" => ["0.","0.",".."], "c" => ["00","..",".."], "d" => ["00",".0",".."],
        "e" => ["0.",".0",".."], "f" => ["00","0.",".."], "g" => ["00","00",".."], "h" => ["0.","00",".."],
        "i" => [".0","0.",".."], "j" => [".0","00",".."], "k" => ["0.","..","0."], "l" => ["0.","0.","0."],
        "m" => ["00","..","0."], "n" => ["0.",".0","0."], "o" => ["0.",".0","0."], "p" => ["00","0.","0."],
        "r" => ["0.","00","0."], "s" => [".0","0.","0."], "t" => [".0","00","0."], "u" => ["0.","..","00"],
        "v" => ["0.","0.","00"], "w" => [".0","00",".0"], "x" => ["00","..","00"], "y" => ["00",".0","00"],
        "z" => ["0.",".0","00"], "!" => ["..","00","0."], "'" => ["..","..","0."], "," => ["..","0.",".."],
        "-" => ["..","..","00"], "." => ["..","00",".0"], "?" => ["..","0.","00"], "capitals" => ["..", "..", ".0"],
        "numbers" => [".0", ".0", "00"], " " => ["..","..",".."]}, braille_runner.initializer
  end
  def test_it_prints_three_strings
    braille_runner = BrailleRunner.new
    assert_equal "strings here", braille_runner.echo
  end
  def test_convert_to_braille
    braille_runner = BrailleRunner.new
    assert_equal braille, braille_runner.convert_to_braille
  end
  def test_convert_to_text
    braille_runner = BrailleRunner.new
    assert_equal "some text", braille_runner.count
  end
  def test_for_captial_letter_to_braille
    braille_runner = BrailleRunner.new
    assert_equal "A", braille_runner.count
  end
end