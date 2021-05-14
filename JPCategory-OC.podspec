
Pod::Spec.new do |s|

  s.name         = "JPCategory-OC"
  s.version      = "2.1.6"
  s.summary      = "views categories."
  s.homepage     = "https://github.com/baiyidjp/JPCategory-OC"
  s.license      = "MIT"
  s.author             =  "baiyidjp"
  s.ios.deployment_target = "9.0"
  s.source       = { :git => "https://github.com/baiyidjp/JPCategory-OC.git", :tag => "#{s.version}" }
  s.source_files  = "JPCategory-OC/*.{h,m}"
  s.requires_arc = true
  s.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  s.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }

  #Base
  s.subspec 'Base' do |ss|
  ss.source_files = "JPCategory-OC/Base/*.{h,m}"
  ss.dependency 'JPCategory-OC/SwizzledMethod'
  end

  #Config
  s.subspec 'Config' do |ss|
  ss.source_files = "JPCategory-OC/Base/JPCategoryConfig.{h,m}"
  end

  #SwizzledMethod
  s.subspec 'SwizzledMethod' do |ss|
  ss.source_files = "JPCategory-OC/SwizzledMethod/*.{h,m}"
  end

  #CrashGuard
  s.subspec 'CrashGuard' do |ss|
  ss.source_files = "JPCategory-OC/CrashGuard/*.{h,m}"
  ss.dependency 'JPCategory-OC/SwizzledMethod'
  end

  #UIImage
  s.subspec 'UIImage' do |ss|
  ss.source_files = "JPCategory-OC/Base/UIImage+JPCategory.{h,m}"
  end

  #UIView
  s.subspec 'UIView' do |ss|
  ss.source_files = "JPCategory-OC/Base/UIView+JPCategory.{h,m}"
  end

  #UIColor
  s.subspec 'UIColor' do |ss|
  ss.source_files = "JPCategory-OC/Base/UIColor+JPCategory.{h,m}"
  end

  #UILabel
  s.subspec 'UILabel' do |ss|
  ss.source_files = "JPCategory-OC/Base/UILabel+JPCategory.{h,m}"
  ss.dependency 'JPCategory-OC/Config'
  end

  #UIButton
  s.subspec 'UIButton' do |ss|
  ss.source_files = "JPCategory-OC/Base/UIButton+JPCategory.{h,m}"
  end

  #UIButtonImagePosition
  s.subspec 'UIButtonImagePosition' do |ss|
  ss.source_files = "JPCategory-OC/Base/UIButton+JPImagePosition.{h,m}"
  end

  #UIButtonRemoveHighlight
  s.subspec 'UIButtonRemoveHighlight' do |ss|
  ss.source_files = "JPCategory-OC/Base/UIButton+JPRemoveHighlight.{h,m}"
  ss.dependency 'JPCategory-OC/SwizzledMethod'
  end

  #UINavigationBar
  s.subspec 'UINavigationBar' do |ss|
  ss.source_files = "JPCategory-OC/Base/NSObject+JPNavigationBar.{h,m}"
  ss.dependency 'JPCategory-OC/Config'
  ss.dependency 'JPCategory-OC/SwizzledMethod'
  end

  #NSBundle
  s.subspec 'NSBundle' do |ss|
  ss.source_files = "JPCategory-OC/Base/NSBundle+JPCategory.{h,m}"
  end

  #NSArray
  s.subspec 'NSArray' do |ss|
  ss.source_files = "JPCategory-OC/Base/NSArray+JPCategory.{h,m}"
  end

# pod trunk push --allow-warnings --skip-import-validation

end
