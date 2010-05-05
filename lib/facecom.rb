require 'json'
require 'net/http'
require 'uri'
require 'ostruct'
require 'cgi'
require 'yaml'

require 'facecom/tag'

# You must have a facecom.yml file in the directory you're running from. It
# should look like this
#     api_key: abcde
#     api_secret: sekret
module Facecom
  BASE_URL = "http://api.face.com/faces"
  
  #/detect.json?api_key=acf2fd6e76dc80da4c51130c56e16b90&api_secret=54ad0858eb9973b43f50224cbf6c8a37&urls=http://github.com/downloads/trotter/trotter.github.com/trotter.jpg"
  def self.detect(url)
    face_url = "#{BASE_URL}/detect.json?api_key=%s&api_secret=%s&urls=%s" %
               [api_key, api_secret, url].map { |i| CGI.escape(i) }
    raw = Net::HTTP.get(URI.parse(face_url))
    json = JSON.parse(raw)
    json["photos"].map { |p| p["tags"].map { |t| Facecom::Tag.new(t) }}.flatten
  end

  def self.config_file
    "./facecom.yml"
  end

  def self.config
    @config ||= YAML.load_file(config_file)
  end

  def self.api_key
    config["api_key"]
  end

  def self.api_secret
    config["api_secret"]
  end
end
