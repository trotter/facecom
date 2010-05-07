require 'test_helper'

class FacecomTagTest < Test::Unit::TestCase
  setup do
    @json = PARSED_RESPONSES[:detect]["photos"].first
    @tag  = @json["tags"].first
    @face = Facecom::Tag.new(@json["width"], @json["height"], @tag)
  end

  test "should return raw tag json" do
    assert_equal @tag, @face.json
  end

  test "should have width" do
    assert_equal @json["width"] * @tag["width"] / 100, @face.width
  end

  test "should have height" do
    assert_equal @json["height"] * @tag["height"] / 100, @face.height
  end

  test "should have center" do
    assert_equal @tag["center"]["x"] * @json["width"] / 100, @face.center.x
    assert_equal @tag["center"]["y"] * @json["height"] / 100, @face.center.y
  end

  test "should have top left" do
    assert_equal @face.center.x - (@face.width / 2), @face.top_left.x
    assert_equal @face.center.y - (@face.height / 2), @face.top_left.y
  end
end
