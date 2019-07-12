#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'image_tailor'
  s.version          = '0.0.1'
  s.summary          = 'image_tailor'
  s.description      = <<-DESC
image_tailor
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'vtesoho@163.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'YPImagePicker'
  s.static_framework = true

  s.ios.deployment_target = '9.0'


end

