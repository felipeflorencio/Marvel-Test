iOS_version = '13.0'
platform :ios, iOS_version

inhibit_all_warnings!
use_frameworks!

## Pods
def toolsPods
    pod 'Kingfisher'
    pod 'CryptoSwift'
    pod 'Alamofire'
    pod 'CoreNetwork', :git => "https://github.com/AnasAlhasani/CoreNetwork"
end

## Application

target 'Marvel-Heijn' do

  toolsPods
  
  target 'Marvel-HeijnTests' do
    inherit! :search_paths
  end
end

## Post Install

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = iOS_version
    end
  end
end
