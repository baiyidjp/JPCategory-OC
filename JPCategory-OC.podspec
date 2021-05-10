
Pod::Spec.new do |s|

  s.name         = "JPCategory-OC"
  s.version      = "2.0.0"
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

  #Config
  s.subspec 'Config' do |ss|
  ss.source_files = "JPCategory-OC/Config/*.{h,m}"
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

  #UIKitCategory
  s.subspec 'JPUIKitCategory' do |ss|
  ss.source_files = "JPCategory-OC/JPUIKitCategory/*.{h,m}"
  ss.dependency 'JPCategory-OC/SwizzledMethod'
  end

  # #FoundationCategory
  # s.subspec 'NSCategory' do |ss|
  # ss.source_files = "JPCategory-OC/NSCategory/*.{h,m}"
  # ss.dependency 'JPCategory-OC/SwizzledMethod'
  # end

  #UIImage
  s.subspec 'UIImage' do |ss|
  ss.source_files = "JPCategory-OC/JPUIKitCategory/UIImage+JPCategory.{h,m}"
  end

  #UIView
  s.subspec 'UIView' do |ss|
  ss.source_files = "JPCategory-OC/JPUIKitCategory/UIView+JPCategory.{h,m}"
  end

  #UIColor
  s.subspec 'UIColor' do |ss|
  ss.source_files = "JPCategory-OC/JPUIKitCategory/UIColor+JPCategory.{h,m}"
  end

  #UILabel
  s.subspec 'UILabel' do |ss|
  ss.source_files = "JPCategory-OC/JPUIKitCategory/UILabel+JPCategory.{h,m}"
  ss.dependency 'JPCategory-OC/Config'
  end

  #UIButton
  s.subspec 'UIButton' do |ss|
  ss.source_files = "JPCategory-OC/JPUIKitCategory/UIButton+JPCategory.{h,m}"
  end

  #UIButtonImagePosition
  s.subspec 'UIButtonImagePosition' do |ss|
  ss.source_files = "JPCategory-OC/JPUIKitCategory/UIButton+JPImagePosition.{h,m}"
  end

  #UIButtonRemoveHighlight
  s.subspec 'UIButtonRemoveHighlight' do |ss|
  ss.source_files = "JPCategory-OC/JPUIKitCategory/UIButton+JPRemoveHighlight.{h,m}"
  ss.dependency 'JPCategory-OC/SwizzledMethod'
  end

  #UINavigationBar
  s.subspec 'UINavigationBar' do |ss|
  ss.source_files = "JPCategory-OC/NSCategory/NSObject+JPNavigationBar.{h,m}"
  ss.dependency 'JPCategory-OC/Config'
  ss.dependency 'JPCategory-OC/SwizzledMethod'
  end

  #NSBundle
  s.subspec 'NSBundle' do |ss|
  ss.source_files = "JPCategory-OC/NSCategory/NSBundle+JPCategory.{h,m}"
  end

  #NSArray
  s.subspec 'NSArray' do |ss|
  ss.source_files = "JPCategory-OC/NSCategory/NSArray+JPCategory.{h,m}"
  end

# pod trunk push --allow-warnings --skip-import-validation

end
