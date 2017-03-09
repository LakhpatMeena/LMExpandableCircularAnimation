#
# Be sure to run `pod lib lint LMExpandableCircularAnimation.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'LMExpandableCircularAnimation'
  s.version          = '0.1.0'
  s.summary          = 'Get a expandable circular animation in LMExpandableCircularAnimation.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'Create your own circular animation with the help of LMExpandableCircularAnimation'

  s.homepage         = 'https://github.com/Lakhpat Meena/LMExpandableCircularAnimation'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Lakhpat Meena' => 'lakhpatmeena01@gmail.com' }
  s.source           = { :git => 'https://github.com/Lakhpat Meena/LMExpandableCircularAnimation.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'LMExpandableCircularAnimation/Classes/**/*'
  
  # s.resource_bundles = {
  #   'LMExpandableCircularAnimation' => ['LMExpandableCircularAnimation/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
