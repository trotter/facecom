module Facecom
  class Tag
    attr_reader :json

    def initialize(json)
      @json = json
    end

    def width
      @json["width"]
    end

    def height
      @json["height"]
    end

    def center
      OpenStruct.new(@json["center"])
    end
  end
end
