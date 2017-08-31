platform :ios, '9.0'
use_frameworks!
target 'SimpleTwitterClient' do
    
    pod 'RealmSwift'
    pod 'R.swift'
    pod 'SVProgressHUD'
    pod 'SDWebImage', '~>3.8'
    pod 'IQKeyboardManagerSwift'
    pod 'ObjectMapper+Realm'
    pod 'ReactiveKit', '~> 3.2'
    pod 'Bond'
    pod 'Hero'
    pod 'DZNEmptyDataSet'
    pod 'TwitterKit'
    pod 'AlamofireObjectMapper', '~> 4.0'
    pod 'MXParallaxHeader'
    
    target 'SimpleTwitterClientTests' do
        #pod 'Realm/Headers'
    end
end

post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
