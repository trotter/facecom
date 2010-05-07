module Facecom
  class Tag
    attr_reader :json

    def initialize(photo_width, photo_height, json)
      @photo_width = photo_width
      @photo_height = photo_height
      @json = json
    end

    def width
      @json["width"] * @photo_width / 100
    end

    def height
      @json["height"] * @photo_height / 100
    end

    def center
      x = @json["center"]["x"] * @photo_width / 100
      y = @json["center"]["y"] * @photo_height / 100
      OpenStruct.new(:x => x, :y => y)
    end

    def top_left
      OpenStruct.new(:x => center.x - width / 2,
                     :y => center.y - height / 2)
    end
  end
end
