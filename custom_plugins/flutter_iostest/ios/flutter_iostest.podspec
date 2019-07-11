#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#
Pod::Spec.new do |s|
  s.name             = 'flutter_iostest'
  s.version          = '1.0.1'
  s.summary          = 'A new Flutter plugin.'
  s.description      = <<-DESC
A new Flutter plugin.
                       DESC
  s.homepage         = 'http://example.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Your Company' => 'email@example.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.dependency 'AMapSearch'
  s.dependency 'YPImagePicker', '4.0.0'
  s.dependency 'BSImagePicker', '2.9.0'

  #s.pod_target_xcconfig = { "DEFINES_MODULE" => "YES" }
  s.swift_version = '4.2'
  s.ios.deployment_target = '9.0'
end

