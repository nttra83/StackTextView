#
# Be sure to run `pod lib lint TimelineTableViewCell.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'StackTextView'
  s.version          = '1.0.1'
  s.summary          = 'A text view that can dynamically adapt to the content size'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = 'StackTextView is a text view that can dynamically adapt to the content size. All UIView can be stacked in the text view to implement the Facebook-like add-post UI.'

  s.homepage         = 'https://github.com/kf99916/StackTextView'
  s.screenshots      = 'https://raw.githubusercontent.com/kf99916/StackTextView/master/screenshots/stackTextView.gif'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Zheng-Xiang Ke' => 'kf99916@gmail.com' }
  s.source           = { :git => 'https://github.com/kf99916/StackTextView.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'StackTextView/**/*.swift'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
