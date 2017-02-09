require 'minitest/autorun'
require 'minitest/pride'
require './lib/night_write'

class NightWriteTest < Minitest::Test

  def test_it_exist
    night_writer = NightWriteTest.new
    assert_instance_of NightWriteTest, night_writer
  end

  def test_it_has_three_outputs
     = BrailleRunner.new
    assert_equal 3, braille_runner.count
  end

end
