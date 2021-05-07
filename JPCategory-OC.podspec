
Pod::Spec.new do |s|

  s.name         = "JPCategory-OC"
  s.version      = "1.6.1"
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

  #UIViewCOntroller
  s.subspec 'UIViewController' do |ss|
  ss.source_files = "JPCategory-OC/UIViewController/*.{h,m}"
  end

  #UIButton
  s.subspec 'UIButton' do |ss|
  ss.source_files = "JPCategory-OC/UIButton/*.{h,m}"
  end

  #UIButton/ImagePosition
  s.subspec 'UIButton-ImagePosition' do |ss|
  ss.source_files = "JPCategory-OC/UIButton/UIButton+JPImagePosition.{h,m}"
  end

  #UIView
  s.subspec 'UIView' do |ss|
  ss.source_files = "JPCategory-OC/UIView/*.{h,m}"
  end

  #UILabel
  s.subspec 'UILabel' do |ss|
  ss.source_files = "JPCategory-OC/UILabel/*.{h,m}"
  ss.dependency 'JPCategory-OC/Config'
  end

  #UIColor
  s.subspec 'UIColor' do |ss|
  ss.source_files = "JPCategory-OC/UIColor/*.{h,m}"
  end

  #UIImage
  s.subspec 'UIImage' do |ss|
  ss.source_files = "JPCategory-OC/UIImage/*.{h,m}"
  end

  #NSObject
  s.subspec 'NSObject' do |ss|
  ss.source_files = "JPCategory-OC/NSObject/*.{h,m}"
  ss.dependency 'JPCategory-OC/Config'
  end

  #NSArray
  s.subspec 'NSArray' do |ss|
  ss.source_files = "JPCategory-OC/NSArray/*.{h,m}"
  end

  #NSBundle
  s.subspec 'NSBundle' do |ss|
  ss.source_files = "JPCategory-OC/NSBundle/*.{h,m}"
  end
# pod trunk push --allow-warnings --skip-import-validation

end
