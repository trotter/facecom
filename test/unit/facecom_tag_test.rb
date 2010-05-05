require 'test_helper'

class FacecomTagTest < Test::Unit::TestCase
  setup do
    @json = PARSED_RESPONSES[:detect]["photos"].first["tags"].first
    @face = Facecom::Tag.new(@json)
  end

  test "should return raw json" do
    assert_equal @json, @face.json
  end

  test "should have width" do
    assert_equal @json["width"], @face.width
  end

  test "should have height" do
    assert_equal @json["height"], @face.height
  end

  test "should have center" do
    assert_equal @json["center"]["x"], @face.center.x
    assert_equal @json["center"]["y"], @face.center.y
  end
end
