
Pod::Spec.new do |spec|

  spec.name         = "SawtoothSigning"
  spec.version      = "0.0.1"
  spec.summary      = "ECDSA 椭圆曲线 Swift 端基于 secp256k1 实现的签名与验证"

#  spec.description  = <<-DESC
#                  DESC

  spec.description  = 'ECDSA 椭圆曲线 签名与验证, Swift端基于 secp256k1 的实现'
  spec.homepage     = "https://github.com/Ann-iOS/SawtoothSigning"

  # spec.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"

  # spec.license      = "MIT (example)"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Ann-iOS" => "m18620345206@163.com" }

  spec.platform     = :ios
  # spec.platform     = :ios, "5.0"
  spec.ios.deployment_target = '10.0'

  # spec.source       = { :git => "http://EXAMPLE/SawtoothSigning.git", :tag => "#{spec.version}" }

  spec.source       = { :git => "https://github.com/Ann-iOS/SawtoothSigning.git", :tag => spec.version.to_s }

  spec.pod_target_xcconfig = { 'ARCHS[sdk=iphonesimulator*]' => '$(ARCHS_STANDARD_64_BIT)' }


  spec.source_files  = "SawtoothSigning", "SawtoothSigning/**/*.{h,m}"

  # spec.public_header_files = "Classes/**/*.h"

  # spec.source_files  = "SawtoothSigning/**/*.{h,m}"
  spec.exclude_files = "SawtoothSigning/**/*.h"

  spec.requires_arc     = true
  spec.static_framework = true
  spec.frameworks       = "Security"
  spec.dependency "secp256k1.swift"





  # spec.resource  = "icon.png"
  # spec.resources = "Resources/*.png"

  # spec.preserve_paths = "FilesToSave", "MoreFilesToSave"


  # spec.framework  = "SomeFramework"
  # spec.frameworks = "SomeFramework", "AnotherFramework"

  # spec.library   = "iconv"
  # spec.libraries = "iconv", "xml2"

  # spec.requires_arc = true

  # spec.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
  # spec.dependency "JSONKit", "~> 1.4"

end
