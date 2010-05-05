PKG_VERSION = "0.1.0"
PKG_FILES   = Dir['README',
                  'lib/**/*.rb']

$spec = Gem::Specification.new do |s|
  s.name = 'facecom'
  s.version = PKG_VERSION
  s.summary = "A ruby wrapper for the face.com api"
  s.description = <<EOS
  Face.com provides face detection and recognition services. This library
  is a wrapper for the Face.com api.
EOS

  s.add_dependency("json", ">= 1.2.4")
  s.files       = PKG_FILES.to_a
  s.has_rdoc    = false
  s.author      = "Trotter Cashion"
  s.email       = "cashion@gmail.com"
  s.homepage    = "http://trottercashion.com"
end
