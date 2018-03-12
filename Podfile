platform:ios,'9.0'
use_frameworks!

post_install do |installer|
    # 需要指定编译版本的第三方的名称
    myTargets = ['EZSwiftExtensions']
    
    installer.pods_project.targets.each do |target|
        if myTargets.include? target.name
            target.build_configurations.each do |config|
                config.build_settings['SWIFT_VERSION'] = '3.2'
            end
        end
    end
end

target 'Gank_Swift' do
    pod 'Then'
	pod 'RxSwift'
    pod 'NSObject+Rx'

	pod 'Moya'
	pod 'Moya/RxSwift'
	pod 'HandyJSON'

	pod 'SnapKit'
    pod 'SVProgressHUD'
    pod 'EZSwiftExtensions'
end
