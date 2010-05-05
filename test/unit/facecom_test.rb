require 'test_helper'

class FacecomTest < Test::Unit::TestCase
  test "should detect faces" do
    tags = Facecom.detect("http://test.host/some_pic.jpg")
    assert_equal PARSED_RESPONSES[:detect]["photos"].first["tags"].first,
                 tags.first.json
  end
end
