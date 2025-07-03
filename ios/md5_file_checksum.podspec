#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint md5_file_checksum.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'md5_file_checksum'
  s.version = '1.1.0'
  s.summary          = 'A Flutter plugin for getting the MD5 hash of a file.'
  s.description      = <<-DESC
A Flutter plugin for getting the MD5 hash of a file.
                       DESC
  s.homepage         = 'https://albemala.me/'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Alberto Malagoli' => 'albemala@gmail.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'
  s.platform = :ios, '9.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
