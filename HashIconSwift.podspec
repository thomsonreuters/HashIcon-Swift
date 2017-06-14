Pod::Spec.new do |s|
 s.name = 'HashIconSwift'
 s.version = '1.0.0'
 s.license = { :type => "MIT", :file => "LICENSE" }
 s.summary = 'Swift library which takes in a string and draws a pictorial representation of that string.'
 s.authors = { "Francisco Pereira" => "francisco.pereira@thomsonreuters.com" }
 s.source = { :git => "https://git.sami.int.thomsonreuters.com/nopass/hashicon-swift.git" }
 s.platforms     = { :ios => "9.0" }
 s.requires_arc = true

 s.default_subspec = "Core"
 s.subspec "Core" do |ss|
     ss.source_files  = "Sources/*.swift"
     ss.framework  = "Foundation"
 end

 # Create module.map files for CommonCrypto framework
 spec.preserve_paths = "Frameworks"
 spec.prepare_command = <<-CMD
 sh ./modulemap.sh
 CMD

end