Pod::Spec.new do |s|
    s.name = 'HashIconSwift'
    s.version = '1.0.7'
    s.license = { :type => "Apache 2.0", :file => "LICENSE.md" }
    s.summary = 'Swift library which takes in a string and draws a pictorial representation of that string.'
    s.authors = { "Francisco Pereira" => "francisco.pereira@thomsonreuters.com" }
    s.homepage = 'http://thomsonreuters.com'
    s.source = { :git => "https://git.sami.int.thomsonreuters.com/nopass/hashicon-swift.git" }
    s.platforms     = { :ios => "9.0" }
    #s.platforms     = { :ios => "9.0", :osx => "10.10", :tvos => "9.0", :watchos => "2.0" }
    s.requires_arc = true

    s.source_files  = "Sources/**/*.{h,swift}"

    # Create module.map files for CommonCrypto framework
    s.preserve_paths = "Frameworks"
    s.prepare_command = <<-CMD
    sh ./modulemap.sh
    CMD

    # add the new module to Import Paths
    s.xcconfig = {
    "SWIFT_INCLUDE_PATHS" => "$(PODS_ROOT)/HashIconSwift/Frameworks/$(PLATFORM_NAME)",
    "FRAMEWORK_SEARCH_PATHS" => "$(PODS_ROOT)/HashIconSwift/Frameworks/$(PLATFORM_NAME)"
    }

end
