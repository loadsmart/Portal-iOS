Pod::Spec.new do |s|
  s.name             = 'Portal'
  s.version          = '0.1.0'
  s.summary          = 'Easily switch between environments while debugging your app.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/loadsmart/Portal-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Gustavo Barbosa' => 'gustavo@loadsmart.com' }
  s.source           = { :git => 'https://github.com/loadsmart/Portal-iOS.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'Portal/Classes/**/*'
end

