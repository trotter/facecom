require 'rubygems'
require 'facecom'
require 'mocha'

require 'test/unit'

BASE_DIR = File.dirname(__FILE__)
RESPONSES = {
  :detect => File.read(BASE_DIR + "/support/detect_response.json")
}
PARSED_RESPONSES = Hash[*RESPONSES.map { |k, v|
  [k, JSON.parse(v)]
}.flatten]

class Test::Unit::TestCase
  def self.setup(&block)
    define_method(:setup, &block)
  end

  def self.teardown(&block)
    define_method(:teardown, &block)
  end

  def self.test(name, &block)
    define_method("test: #{name} ", &block)
  end

  # Global Setup
  setup do
    Net::HTTP.stubs(:get).returns(RESPONSES[:detect])
    Facecom.stubs(:config).returns({
      "api_key" => "abcde",
      "api_secret" => "bcddd"
    })
  end
end

class Object
  def debug
    require 'ruby-debug'; debugger
  end
end
