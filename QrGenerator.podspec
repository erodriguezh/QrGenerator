#
# Be sure to run `pod lib lint QrGenerator.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'QrGenerator'
  s.version          = '0.1.0'
  s.summary          = 'Generate Qr codes with color, gradient and a logo.'
  s.description      = 'QrGenerator is a library, which helps you create qr codes with color, gradient and a logo.'
  s.homepage         = 'https://github.com/erodriguezh/QrGenerator'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'erodriguezh' => '' }
  s.source           = { :git => 'https://github.com/erodriguezh/QrGenerator.git', :tag => s.version.to_s }
  s.ios.deployment_target = '8.0'
  s.source_files = 'QrGenerator/Classes/**/*'
  s.public_header_files = 'QrGenerator/Classes/**/*.h'
  s.frameworks = 'CoreImage'
end
