
Pod::Spec.new do |spec|

  spec.name         = "JHAlert"
  
  spec.version      = "1.1.1"
  
  spec.summary      = "A simple Alert with iOS."

  spec.description  = "A simple Alert with iOS, you can use in your project."

  spec.homepage     = "https://github.com/Zero-Cjh"
  
  spec.license      = { :file => "FILE_LICENSE" }

  spec.author             = { "Zero-Cjh" => "876832130@qq.com" }

  spec.platform     = :ios, "11.0"

  spec.source       = { :git => "https://github.com/Zero-Cjh/JHAlert.git", :tag => "#{spec.version}" }
  
  spec.source_files  = "Sources/JHAlert/*.swift", "Sources/JHAlert/**/*.swift"
  
  spec.framework = 'UIKit', 'Foundation'
  spec.dependency 'SnapKit'
  
  spec.requires_arc = true
  
  spec.swift_versions = ['5.0']

end
