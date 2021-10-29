
Pod::Spec.new do |spec|

  spec.name         = "SawtoothSigning"
  spec.version      = "1.0.1"
  spec.summary      = "ECDSA 椭圆曲线 Swift 端基于 secp256k1 实现的签名与验证"

#  spec.description  = <<-DESC
#                  DESC

  spec.description  = 'ECDSA 椭圆曲线 签名与验证, Swift端基于 secp256k1 的实现'
  spec.homepage     = "https://github.com/Ann-iOS/SawtoothSigning"

  spec.license      = { :type => "MIT", :file => "LICENSE" }

  spec.author             = { "Ann-iOS" => "m18620345206@163.com" }

  spec.platform     = :ios
  spec.ios.deployment_target = '9.0'

  spec.source       = { :git => "https://github.com/Ann-iOS/SawtoothSigning.git", :tag => spec.version.to_s }

  spec.pod_target_xcconfig = { 'ARCHS[sdk=iphonesimulator*]' => '$(ARCHS_STANDARD_64_BIT)' }
  spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }


  # spec.pod_target_xcconfig = { 'VALID_ARCHS' => 'arm64 armv7 armv7s x86_64' }

  spec.source_files  = "SawtoothSigning", "SawtoothSigning/**/*.{h,m}"

  # spec.public_header_files = "Classes/**/*.h"
  # spec.source_files  = "SawtoothSigning/**/*.{h,m}"

  spec.exclude_files = "SawtoothSigning/**/*.h"

  spec.requires_arc     = true
  spec.static_framework = true
  spec.frameworks       = "Security"
  spec.dependency "secp256k1.swift", '~> 0.1.4'


end
